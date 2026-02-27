import Quickshell.Io
import QtQuick
import qs.services

BarButton {
    icon: AudioService.volumeIcon
    text: AudioService.volumeMuted ? null : AudioService.volume
    onMainAction: AudioService.toggleVolume()
    onSecondaryAction: process.startDetached()

    Process {
        id: process
        command: ["pavucontrol"]
    }
}
