pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    readonly property string socketPath: Quickshell.env("NIRI_SOCKET")
    property var windowById: new Map()                  // Map<windowId, { id, title, appId, workspaceId }>
    property var workspaceById: new Map()               // Map<workspaceId, { id, screenName }>
    property var activeWindowIdByWorkspaceId: new Map() // Map<workspaceId, windowId>
    property var activeWorkspaceIdByScreen: new Map()   // Map<screenName, workspaceId>

    Socket {
        id: eventsSocket
        path: root.socketPath
        connected: true

        onConnectionStateChanged: {
            if (connected) {
                console.info(`Niri: Connected to events socket: ${root.socketPath}`);
                root.send(eventsSocket, "EventStream");
            } else {
                console.error(`Niri: Disconnected from events socket: ${root.socketPath}`);
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

        function handleEvent(event: var): void {
            const eventType = Object.keys(event)[0];
            event = event[eventType];

            switch (eventType) {
            // Reports all initial windows
            case "WindowsChanged":
                root.windowById = new Map();
                for (const window of event.windows) {
                    root.windowById.set(window.id, trackedWindowFields(window));
                    root.windowByIdChanged();
                }
                break;

            // Window was opened or changed
            case "WindowOpenedOrChanged":
                root.windowById.set(event.window.id, trackedWindowFields(event.window));
                root.windowByIdChanged();
                break;

            // Window was closed
            case "WindowClosed":
                root.windowById.delete(event.id);
                root.windowByIdChanged();
                break;

            // Reports all initial workspaces
            case "WorkspacesChanged":
                root.workspaceById = new Map();
                for (const workspace of event.workspaces) {
                    root.workspaceById.set(workspace.id, trackedWorkspaceFields(workspace));
                    root.workspaceByIdChanged();

                    root.activeWindowIdByWorkspaceId.set(workspace.id, workspace.active_window_id);
                    root.activeWindowIdByWorkspaceIdChanged();

                    if (workspace.is_active) {
                        root.activeWorkspaceIdByScreen.set(workspace.output, workspace.id);
                        root.activeWorkspaceIdByScreenChanged();
                    }
                }
                break;

            // Window was focused in a workspace
            case "WorkspaceActiveWindowChanged":
                root.activeWindowIdByWorkspaceId.set(event.workspace_id, event.active_window_id);
                root.activeWindowIdByWorkspaceIdChanged();
                break;

            // User switched to a workspace and it's now active on a screen
            case "WorkspaceActivated":
                const output = root.workspaceById.get(event.id)?.screenName;
                root.activeWorkspaceIdByScreen.set(output, event.id);
                root.activeWorkspaceIdByScreenChanged();
                break;
            }

            function trackedWindowFields(window: var): var {
                return {
                    id: window.id,
                    title: window.title,
                    appId: window.app_id,
                    workspaceId: window.workspace_id
                };
            }

            function trackedWorkspaceFields(workspace: var): var {
                return {
                    id: workspace.id,
                    screenName: workspace.output
                };
            }
        }
    }

    Socket {
        id: actionsSocket
        path: root.socketPath
        connected: true
    }

    function windowsByScreen(screenName: string): list<var> {
        const workspaceId = activeWorkspaceIdByScreen.get(screenName);
        const windows = [];
        windowById.forEach(window => {
            if (window.workspaceId === workspaceId)
                windows.push(window);
        });
        return windows;
    }

    function activeWindowIdByScreen(screenName: string): var {
        const workspaceId = activeWorkspaceIdByScreen.get(screenName);
        return activeWindowIdByWorkspaceId.get(workspaceId) ?? null;
    }

    function activeWindowByScreen(screenName: string): var {
        const windowId = activeWindowIdByScreen(screenName);
        return windowById.get(windowId) ?? null;
    }

    function focusWindow(windowId: int): void {
        send(actionsSocket, {
            Action: {
                FocusWindow: {
                    id: windowId
                }
            }
        });
    }

    function send(socket: Socket, data: var): void {
        const message = JSON.stringify(data) + "\n";
        socket.write(message);
        socket.flush();
    }
}
