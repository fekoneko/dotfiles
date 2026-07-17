pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property real height: 24
    readonly property real fontSize: 12
    readonly property real iconSize: 12
    readonly property real taskbarIconSize: 15
    readonly property real maxWindowTitleWidth: 500
    readonly property real maxAnkiWidth: 150

    readonly property color backdropColor: '#23202c'
    readonly property color fgColor: "#ffffff"
    readonly property color bgColor: "#ffffff"
    readonly property color shadowColor: "#000000"

    readonly property real backdropOpacity: 0.35
    readonly property real fgPrimaryOpacity: 0.8
    readonly property real fgSecondaryOpacity: 0.6
    readonly property real bgHoverOpacity: 0.1
    readonly property real bgPressedOpacity: 0.2
    readonly property real bgSelectedOpacity: 0.1
    readonly property real shadowOpacity: 0.25

    readonly property real animationDuration: 100
}
