pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  readonly property string socketPath: Quickshell.env("NIRI_SOCKET")
  property var windows: new Map()            // Map<windowId, { title, workspaceId }>
  property var workspaces: new Map()         // Map<workspaceId, { screenName }>
  property var activeWindowIds: new Map()    // Map<workspaceId, windowId>
  property var activeWorkspaceIds: new Map() // Map<screenName, workspaceId>

  Socket {
    id: eventsSocket
    path: socketPath
    connected: true

    onConnectionStateChanged: {
      if (connected) {
        console.info(`Niri: Connected to socket: ${socketPath}`);
        send(eventsSocket, "EventStream");
      } else {
        console.error(`Niri: Disconnected from socket: ${socketPath}`);
      }
    }

    parser: SplitParser {
      onRead: (line) => {
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
        case "WindowsChanged":
          windows = new Map();
          for (const window of event.windows) {
            windows.set(window.id, trackedWindowFields(window));
            windowsChanged(); // Let QML know the map was mutated internally
          }
          break;

        case "WindowOpenedOrChanged":
          windows.set(event.window.id, trackedWindowFields(event.window));
          windowsChanged(); // Let QML know the map was mutated internally
          break;

        case "WindowClosed":
          windows.delete(event.id);
          windowsChanged(); // Let QML know the map was mutated internally
          break;

        case "WorkspacesChanged":
          workspaces = new Map();
          for (const workspace of event.workspaces) {
            workspaces.set(workspace.id, trackedWorkspaceFields(workspace));
            workspacesChanged(); // Let QML know the map was mutated internally

            activeWindowIds.set(workspace.id, workspace.active_window_id);
            activeWindowIdsChanged(); // Let QML know the map was mutated internally

            if (workspace.is_active) activeWorkspaceIds.set(workspace.output, workspace.id);
          }
          break;

        case "WorkspaceActiveWindowChanged":
          activeWindowIds.set(event.workspace_id, event.active_window_id);
          activeWindowIdsChanged(); // Let QML know the map was mutated internally
          break;

        case "WorkspaceActivated":
          const output = workspaces.get(event.id)?.screenName;
          activeWorkspaceIds.set(output, event.id);
          activeWorkspaceIdsChanged(); // Let QML know the map was mutated internally
          break;
      }

      function trackedWindowFields(window) {
        return {
          id: window.id,
          title: window.title,
          workspaceId: window.workspace_id,
        };
      }

      function trackedWorkspaceFields(workspace) {
        return { screenName: workspace.output };
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
