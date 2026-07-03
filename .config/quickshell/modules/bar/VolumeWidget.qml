import Quickshell
import QtQuick
import qs.services

BarButton {
    icon: AudioService.volumeIcon
    text: AudioService.muted ? null : AudioService.formattedVolume
    onMainAction: AudioService.toggleVolume()
    onSecondaryAction: Quickshell.execDetached("pavucontrol")
}
