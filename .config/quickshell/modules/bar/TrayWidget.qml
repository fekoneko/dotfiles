import Quickshell.Services.SystemTray
import QtQuick
import qs.services

Repeater {
    model: SystemTray.items

    BarButton {
        icon: modelData.icon
        iconSize: 15
        onMainAction: modelData.activate()
        onSecondaryAction: MenuService.showMenu(modelData.menu) // qmllint disable unresolved-type

        required property SystemTrayItem modelData
    }
}
