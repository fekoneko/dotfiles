import QtQuick
import qs.services

BarButton {
    icon: AudioService.microphoneIcon
    onMainAction: AudioService.toggleMicrophone()
    onSecondaryAction: AudioService.toggleMicrophone()
}
