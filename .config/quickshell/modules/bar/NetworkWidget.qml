import Quickshell
import QtQuick
import qs.services

Repeater {
    // Use device as a key to avoid needlessly recreating components
    model: NetworkService.connections.map(c => c.device)

    BarButton {
        id: barButton
        icon: connection.icon
        onMainAction: NetworkService.toggleConnection(connection)

        onSecondaryAction: {
            if (connection.type === "wireguard") {
                const scriptPath = Quickshell.shellPath("assets/scripts/set-wg-ignored-ips.sh");
                Quickshell.execDetached(["kitty", "-e", scriptPath]);
            } else {
                Quickshell.execDetached(["kitty", "-e", "nmtui"]);
            }
        }

        required property string modelData
        property var connection: NetworkService.connections.find(c => c.device === modelData)
    }
}
