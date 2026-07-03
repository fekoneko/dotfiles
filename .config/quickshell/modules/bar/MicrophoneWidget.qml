import Quickshell
import QtQuick
import qs.services

BarButton {
    icon: AudioService.microphoneIcon
    onMainAction: AudioService.toggleMicrophone()
    onSecondaryAction: Quickshell.execDetached("pavucontrol")
}
