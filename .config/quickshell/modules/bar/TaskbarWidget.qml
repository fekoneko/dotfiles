pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import qs.services

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
        iconSize: 15
        onMainAction: NiriService.focusWindow(modelData.id)
        onSecondaryAction: NiriService.focusWindow(modelData.id)

        icon: {
            if (desktopEntry?.icon)
                return Quickshell.iconPath(desktopEntry?.icon);

            return "file://" + Quickshell.shellPath("assets/icons/taskbar-placeholder.svg");
        }

        required property var modelData
        property DesktopEntry desktopEntry: DesktopEntries.byId(barButton.modelData.appId)

        Connections {
            target: DesktopEntries.applications

            function onValuesChanged() {
                barButton.desktopEntry = DesktopEntries.byId(barButton.modelData.appId);
            }
        }
    }
}
