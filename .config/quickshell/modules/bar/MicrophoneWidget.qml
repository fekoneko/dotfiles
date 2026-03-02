import Quickshell.Io
import QtQuick
import qs.services

BarButton {
    icon: AudioService.microphoneIcon
    onMainAction: AudioService.toggleMicrophone()
    onSecondaryAction: process.startDetached()

    Process {
        id: process
        command: ["pavucontrol"]
    }
}
