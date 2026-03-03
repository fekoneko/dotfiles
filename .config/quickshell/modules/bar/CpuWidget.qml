import Quickshell
import Quickshell.Io
import QtQuick
import qs.services

BarButton {
    icon: "file://" + Quickshell.shellPath("assets/icons/cpu.svg")
    text: ResoursesService.formattedCpuUsage
    onMainAction: process.startDetached()
    onSecondaryAction: process.startDetached()

    Process {
        id: process
        command: ["missioncenter"]
    }
}
