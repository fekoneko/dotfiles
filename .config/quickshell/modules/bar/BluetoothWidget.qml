import Quickshell
import QtQuick
import qs.services

BarButton {
    icon: BluetoothService.icon
    onMainAction: BluetoothService.toggle()
    onSecondaryAction: Quickshell.execDetached(["kitty", "-e", "bluetui"])
}
