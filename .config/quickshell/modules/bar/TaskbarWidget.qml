pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import qs.services
import qs.themes

Repeater {
    id: root

    model: {
        const windows = NiriService.windowsByScreen(barWindow.screen.name); // qmllint disable unqualified
        return windows.sort((a, b) => a.order - b.order);
    }

    readonly property var activeWindowId: {
        NiriService.activeWindowIdByScreen(barWindow.screen.name); // qmllint disable unqualified
    }

    BarButton {
        id: barButton
        active: modelData.id === root.activeWindowId
        iconSize: BarTheme.taskbarIconSize
        onMainAction: NiriService.focusWindow(modelData.id)
        onSecondaryAction: NiriService.focusWindow(modelData.id)

        icon: {
            const fallbackIcon = Quickshell.shellPath("assets/icons/taskbar-placeholder.svg");
            Quickshell.iconPath(desktopEntry?.icon, fallbackIcon);
        }

        required property var modelData
        property DesktopEntry desktopEntry: DesktopEntries.byId(barButton.modelData.appId)

        Connections {
            target: DesktopEntries.applications

            function onValuesChanged(): void {
                barButton.desktopEntry = DesktopEntries.byId(barButton.modelData.appId);
            }
        }
    }
}
