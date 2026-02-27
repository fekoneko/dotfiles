pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    readonly property string socketPath: Quickshell.env("NIRI_SOCKET")
    property var windows: new Map()            // Map<windowId, { title, workspaceId }>
    property var workspaces: new Map()         // Map<workspaceId, { screenName }>
    property var activeWindowIds: new Map()    // Map<workspaceId, windowId>
    property var activeWorkspaceIds: new Map() // Map<screenName, workspaceId>

    Socket {
        id: eventsSocket
        path: root.socketPath
        connected: true

        onConnectionStateChanged: {
            if (connected) {
                console.info(`Niri: Connected to socket: ${root.socketPath}`);
                root.send(eventsSocket, "EventStream");
            } else {
                console.error(`Niri: Disconnected from socket: ${root.socketPath}`);
            }
        }

        parser: SplitParser {
            onRead: line => {
                try {
                    const event = JSON.parse(line);
                    eventsSocket.handleEvent(event);
                } catch (error) {
                    console.warn(`Niri: Failed to parse event: ${line}: ${error}`);
                }
            }
        }

        function handleEvent(event) {
            const eventType = Object.keys(event)[0];
            event = event[eventType];

            switch (eventType) {
            // Reports all initial windows
            case "WindowsChanged":
                root.windows = new Map();
                for (const window of event.windows) {
                    root.windows.set(window.id, trackedWindowFields(window));
                    root.windowsChanged();
                }
                break;

            // Window was opened or changed
            case "WindowOpenedOrChanged":
                root.windows.set(event.window.id, trackedWindowFields(event.window));
                root.windowsChanged();
                break;

            // Window was closed
            case "WindowClosed":
                root.windows.delete(event.id);
                root.windowsChanged();
                break;

            // Reports all initial workspaces
            case "WorkspacesChanged":
                root.workspaces = new Map();
                for (const workspace of event.workspaces) {
                    root.workspaces.set(workspace.id, trackedWorkspaceFields(workspace));
                    root.workspacesChanged();

                    root.activeWindowIds.set(workspace.id, workspace.active_window_id);
                    root.activeWindowIdsChanged();

                    if (workspace.is_active)
                        root.activeWorkspaceIds.set(workspace.output, workspace.id);
                }
                break;

            // Window was focused in a workspace
            case "WorkspaceActiveWindowChanged":
                root.activeWindowIds.set(event.workspace_id, event.active_window_id);
                root.activeWindowIdsChanged();
                break;

            // User switched to a workspace and it's now active on a screen
            case "WorkspaceActivated":
                const output = root.workspaces.get(event.id)?.screenName;
                root.activeWorkspaceIds.set(output, event.id);
                root.activeWorkspaceIdsChanged();
                break;
            }

            function trackedWindowFields(window) {
                return {
                    id: window.id,
                    title: window.title,
                    workspaceId: window.workspace_id
                };
            }

            function trackedWorkspaceFields(workspace) {
                return {
                    screenName: workspace.output
                };
            }
        }
    }

    function send(socket, data) {
        const message = JSON.stringify(data) + "\n";
        socket.write(message);
        socket.flush();
    }

    function activeWindowByScreen(screenName) {
        const activeWorkspaceId = activeWorkspaceIds.get(screenName);
        const activeWindowId = activeWindowIds.get(activeWorkspaceId);
        return windows.get(activeWindowId) ?? null;
    }
}
