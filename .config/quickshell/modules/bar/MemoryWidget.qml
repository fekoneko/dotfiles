import Quickshell.Io
import QtQuick
import qs.services
import qs.utils

BarButton {
    icon: Icons.assetIconUrl("memory")
    text: ResoursesService.formattedMemoryUsage
    onMainAction: process.startDetached()
    onSecondaryAction: process.startDetached()

    Process {
        id: process
        command: ["missioncenter"]
    }
}
