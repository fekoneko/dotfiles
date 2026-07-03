import Quickshell
import QtQuick
import qs.services

BarButton {
    icon: BatteryService.icon
    text: BatteryService.formattedPercentage
    onMainAction: Quickshell.execDetached("tlpui")
    onSecondaryAction: Quickshell.execDetached("tlpui")
}
