import Quickshell
import QtQuick
import qs.services

BarButton {
    text: TimeService.formattedTime
    onMainAction: Quickshell.execDetached("gnome-calendar")
    onSecondaryAction: Quickshell.execDetached("gnome-calendar")
}
