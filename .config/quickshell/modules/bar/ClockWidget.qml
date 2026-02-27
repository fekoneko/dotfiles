import Quickshell.Io
import QtQuick
import qs.services

BarButton {
    text: TimeService.time
    onMainAction: process.startDetached()

    Process {
        id: process
        command: ["gnome-calendar"]
    }
}
