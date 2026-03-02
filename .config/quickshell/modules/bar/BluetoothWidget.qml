import Quickshell.Io
import QtQuick
import qs.services

BarButton {
    icon: BluetoothService.icon
    onMainAction: BluetoothService.toggle()
    onSecondaryAction: process.startDetached()

    Process {
        id: process
        command: ["kitty", "-e", "bluetui"]
    }
}
