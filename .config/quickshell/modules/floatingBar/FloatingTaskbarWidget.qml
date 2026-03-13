pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import qs.services
import qs.themes
import qs.utils

Loader {
    id: root
    opacity: showTimer.running ? 1 : 0

    sourceComponent: FlexboxLayout {
        anchors.fill: parent
        justifyContent: FlexboxLayout.JustifyCenter
        alignItems: FlexboxLayout.AlignCenter
        gap: 6

        Repeater {
            id: repeater

            model: {
                const windows = NiriService.windowsByScreen(barWindow.screen.name); // qmllint disable unqualified
                return windows.sort((a, b) => a.order - b.order);
            }

            readonly property var activeWindowId: {
                NiriService.activeWindowIdByScreen(barWindow.screen.name); // qmllint disable unqualified
            }

            FloatingBarButton {
                id: button
                selected: modelData.id === repeater.activeWindowId
                iconSize: FloatingBarTheme.taskbarIconSize
                showTimeout: 500
                maxOpacity: selected ? FloatingBarTheme.taskbarSelectedOpacity : FloatingBarTheme.taskbarOpacity

                icon: {
                    const fallback = Icons.assetPath("taskbar-fallback");
                    return Icons.appIconUrl(button.modelData.appId, fallback); // qmllint disable use-proper-function
                }

                required property var modelData
            }
        }
    }

    function show(): void {
        if (!blockShowTimer.running)
            showTimer.restart();
    }

    Connections {
        target: NiriService

        function onEventWindowLayoutsChanged() {
            root.show();
        }

        function onEventWorkspaceActiveWindowChanged() {
            root.show();
        }

        function onEventWorkspaceActivated() {
            root.show();
        }
    }

    Connections {
        target: IpcService

        // Toggling bar triggers Niri layout change event, but taskbar should stay hidden.
        function onBarExpandedChanged() {
            blockShowTimer.restart();
        }
    }

    Timer {
        id: showTimer
        interval: 500
    }

    Timer {
        id: blockShowTimer
        interval: 100
        running: true
        onRunningChanged: running && showTimer.stop()
    }

    Behavior on opacity {
        NumberAnimation {
            duration: FloatingBarTheme.animationDurationShort

            onRunningChanged: {
                if (root.opacity === 0)
                    root.active = running;
            }
        }
    }
}
