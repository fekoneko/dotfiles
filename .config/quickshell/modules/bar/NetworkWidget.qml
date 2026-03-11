import Quickshell.Io
import QtQuick
import qs.services

Repeater {
    // Use device as a key to avoid needlessly recreating components
    model: NetworkService.connections.map(c => c.device)

    BarButton {
        id: barButton
        icon: connection.icon
        onMainAction: NetworkService.toggleConnection(connection)
        onSecondaryAction: process.startDetached()

        required property var modelData
        property var connection: NetworkService.connections.find(c => c.device === modelData)

        Process {
            id: process
            command: ["kitty", "-e", "nmtui"]
        }
    }
}
