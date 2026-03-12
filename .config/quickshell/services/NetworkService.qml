pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    // {
    //     device: string,
    //     type: "wifi" | "ethernet" | "wireguard",
    //     connected: "connected" | "connecting" | "disconnected" | "disabled", // "disabled" is only for type === "wifi"
    //     connectionId: string | null,
    //     icon: string,
    // }[]
    property list<var> connections: []

    readonly property var defaultWireguardConnection: ({
            device: "wg0",
            type: "wireguard",
            connected: "disconnected",
            connectionId: "be6be9d7-5397-4be6-a9ac-0fb6d79c8b65",
            icon: Quickshell.iconPath(Quickshell.shellPath("assets/icons/network-wireguard-disconnected.svg"))
        })

    Process {
        id: monitorProcess
        running: true
        command: ["nmcli", "monitor"]

        onStarted: {
            console.info(`Network: nmcli monitor started`);
            reconnectTimer.stop();
        }

        onExited: exitCode => { // qmllint disable signal-handler-parameters
            console.warn(`Network: nmcli monitor exited with code ${exitCode}`);
            reconnectTimer.start();
        }

        stdout: SplitParser {
            onRead: refreshTimer.restart()
        }
    }

    Process {
        id: refreshProcess
        running: true
        command: ["nmcli", "-t", "-f", "TYPE,DEVICE,STATE,CON-UUID", "d", "status"]

        stdout: StdioCollector {
            onStreamFinished: {
                let hasWireguard = false;
                const connections = [];

                for (const line of text.split("\n")) {
                    const [type, device, rawStatus, connectionId = null] = line.split(":");
                    if (!["wifi", "ethernet", "wireguard"].includes(type))
                        continue;

                    if (type === "wireguard")
                        hasWireguard = true;

                    let status;
                    if (rawStatus.startsWith("connected"))
                        status = "connected";
                    else if (rawStatus.startsWith("connecting"))
                        status = "connecting";
                    else if (rawStatus.startsWith("disconnected") || type !== "wifi")
                        status = "disconnected";
                    else
                        status = "disabled";

                    const icon = Quickshell.iconPath(Quickshell.shellPath(`assets/icons/network-${type}-${status}.svg`));

                    connections.push({
                        device,
                        type,
                        status,
                        connectionId,
                        icon
                    });
                }

                if (!hasWireguard)
                    connections.push(root.defaultWireguardConnection);

                connections.sort((a, b) => `${a.type}${a.device}$`.localeCompare(`${b.type}${b.device}$`));
                root.connections = connections;
            }
        }
    }

    Timer {
        id: reconnectTimer
        interval: 1000
        onTriggered: {
            refreshProcess.running = true;
            monitorProcess.running = true;
        }
    }

    Timer {
        id: refreshTimer
        interval: 200
        onTriggered: refreshProcess.running = true
    }

    function connect(connectionId: string): void {
        Quickshell.execDetached(["nmcli", "connection", "up", connectionId]);
    }

    function disconnect(connectionId: string): void {
        Quickshell.execDetached(["nmcli", "connection", "down", connectionId]);
    }

    function enableWifi(): void {
        Quickshell.execDetached(["nmcli", "radio", "wifi", "on"]);
    }

    function disableWifi(): void {
        Quickshell.execDetached(["nmcli", "radio", "wifi", "off"]);
    }

    function toggleConnection(connection: var): void {
        if (connection.type === "wifi") {
            if (connection.status !== "disabled") {
                disableWifi();
            } else {
                enableWifi();
            }
        } else if ("wireguard" && connection.connectionId) {
            if (connection.status === "connected") {
                NetworkService.disconnect(connection.connectionId);
            } else {
                NetworkService.connect(connection.connectionId);
            }
        }
    }
}
