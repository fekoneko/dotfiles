import Quickshell.Services.SystemTray
import QtQuick

Repeater {
    model: SystemTray.items

    BarButton {
        id: barButton
        icon: modelData.icon
        onMainAction: modelData.activate()
        onSecondaryAction: barMenu.visible = true

        required property SystemTrayItem modelData

        BarMenu {
            id: barMenu
            menuHandle: barButton.modelData.menu // qmllint disable unresolved-type
        }
    }
}
