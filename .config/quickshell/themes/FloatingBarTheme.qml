pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property real height: 21
    readonly property real fontSize: 12
    readonly property real iconSize: 11
    readonly property real taskbarIconSize: 15
    readonly property real notificationIconSize: 15
    readonly property real maxNotificationWidth: 350

    readonly property color fgColor: "#ffffff"
    readonly property color bgColor: "#303035"
    readonly property color bgHoverColor: "#3a3a40"
    readonly property color bgPressedColor: "#4e4e54"
    readonly property color bgSelectedColor: "#4e4e54"
    readonly property color bdColor: "#4e4e54"
    readonly property color shadowColor: "#000000"

    readonly property real fgOpacity: 0.75
    readonly property real bgOpacity: 1
    readonly property real bgHoverOpacity: 1
    readonly property real bgPressedOpacity: 1
    readonly property real bgSelectedOpacity: 1
    readonly property real taskbarOpacity: 0.5
    readonly property real taskbarSelectedOpacity: 1
    readonly property real shadowOpacity: 0.25

    readonly property real animationDurationShort: 100
    readonly property real animationDurationLong: 150
}
