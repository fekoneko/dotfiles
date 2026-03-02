import Quickshell.Io
import QtQuick
import qs.services

Repeater {
    model: NetworkService.connections

    BarButton {
        id: barButton
        icon: modelData.icon
        onMainAction: NetworkService.toggleConnection(modelData)
        onSecondaryAction: process.startDetached()

        required property var modelData

        Process {
            id: process
            command: ["kitty", "-e", "nmtui"]
        }
    }
}
