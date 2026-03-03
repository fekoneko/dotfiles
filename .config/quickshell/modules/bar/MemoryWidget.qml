import Quickshell
import Quickshell.Io
import QtQuick
import qs.services

BarButton {
    icon: "file://" + Quickshell.shellPath("assets/icons/memory.svg")
    text: ResoursesService.formattedMemoryUsage
    onMainAction: process.startDetached()
    onSecondaryAction: process.startDetached()

    Process {
        id: process
        command: ["missioncenter"]
    }
}
