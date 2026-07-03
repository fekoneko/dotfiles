import Quickshell
import QtQuick
import qs.services
import qs.utils

BarButton {
    icon: Icons.assetIconUrl("memory")
    text: ResoursesService.formattedMemoryUsage
    onMainAction: Quickshell.execDetached("missioncenter")
    onSecondaryAction: Quickshell.execDetached("missioncenter")
}
