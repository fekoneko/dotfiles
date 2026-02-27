import Quickshell.Io
import QtQuick
import qs.services

BarButton {
    icon: AudioService.icon
    text: AudioService.volume
    onMainAction: process.startDetached()

    Process {
        id: process
        command: ["pavucontrol"]
    }
}
