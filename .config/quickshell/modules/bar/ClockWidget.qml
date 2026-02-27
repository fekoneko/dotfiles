import Quickshell.Io
import QtQuick
import qs.services

BarButton {
    text: TimeService.formattedTime
    onMainAction: process.startDetached()
    onSecondaryAction: process.startDetached()

    Process {
        id: process
        command: ["gnome-calendar"]
    }
}
