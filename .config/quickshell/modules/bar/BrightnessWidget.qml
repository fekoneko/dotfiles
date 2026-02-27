import QtQuick
import qs.services

BarButton {
    icon: BrightnessService.icon
    text: BrightnessService.formattedBrightness
    onMainAction: BrightnessService.increaseBrightness()
    onSecondaryAction: BrightnessService.decreaseBrightness()
}
