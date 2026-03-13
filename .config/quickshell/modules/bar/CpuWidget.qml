import Quickshell.Io
import QtQuick
import qs.services
import qs.utils

BarButton {
    icon: Icons.assetIconUrl("cpu")
    text: ResoursesService.formattedCpuUsage
    onMainAction: process.startDetached()
    onSecondaryAction: process.startDetached()

    Process {
        id: process
        command: ["missioncenter"]
    }
}
