import Quickshell
import QtQuick
import qs.services
import qs.utils

BarButton {
    icon: Icons.assetIconUrl("cpu")
    text: ResoursesService.formattedCpuUsage
    onMainAction: Quickshell.execDetached("missioncenter")
    onSecondaryAction: Quickshell.execDetached("missioncenter")
}
