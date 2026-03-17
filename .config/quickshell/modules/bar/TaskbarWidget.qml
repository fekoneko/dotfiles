pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import qs.services
import qs.themes
import qs.utils

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
        id: button
        selected: modelData.id === root.activeWindowId
        iconSize: BarTheme.taskbarIconSize
        onMainAction: NiriService.focusWindow(modelData.id)
        onSecondaryAction: NiriService.focusWindow(modelData.id)

        icon: {
            const fallback = Icons.assetIconPath("taskbar-fallback");
            return Icons.appIconUrl(button.modelData.appId, fallback); // qmllint disable use-proper-function
        }

        required property var modelData
    }
}
