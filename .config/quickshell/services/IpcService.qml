pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    readonly property string socketPath: {
        return Quickshell.env("QUICKSHELL_SOCKET") || (Quickshell.env("XDG_RUNTIME_DIR") + "/quickshell.sock");
    }
    property bool barCollapsed: true

    SocketServer {
        active: true
        path: root.socketPath

        handler: Socket {
            onConnectionStateChanged: {
                if (connected) {
                    console.info(`IPC: New socket connection: ${root.socketPath}`);
                } else {
                    console.info(`IPC: Socket connection dropped: ${root.socketPath}`);
                }
            }

            parser: SplitParser {
                onRead: line => {
                    try {
                        const action = JSON.parse(line);
                        handleAction(action);
                    } catch (error) {
                        console.warn(`IPC: Failed to parse action: ${line}: ${error}`);
                    }
                }

                function handleAction(action: var): void {
                    if (!typeof action === "object" || !action?.action) {
                        console.warn(`IPC: Invalid action: ${JSON.stringify(action)}`);
                        return;
                    }

                    switch (action.action) {
                    // Collpse bar: { "action": "collapse_bar" }
                    case "collapse_bar":
                        root.barCollapsed = true;
                        break;

                    // Expand bar: { "action": "expand_bar" }
                    case "expand_bar":
                        root.barCollapsed = false;
                        break;

                    // Toggle bar: { "action": "toggle_bar" }
                    case "toggle_bar":
                        root.barCollapsed = !root.barCollapsed;
                        break;

                    // Unknown action
                    default:
                        console.warn(`IPC: Unknown action: ${action.action}`);
                    }
                }
            }
        }
    }
}
