import Quickshell.Io
import QtQuick
import qs.services

BarButton {
    icon: BatteryService.icon
    text: BatteryService.percentage
    onMainAction: process.startDetached()
    onSecondaryAction: process.startDetached()

    Process {
        id: process
        command: ["tlpui"]
    }
}
