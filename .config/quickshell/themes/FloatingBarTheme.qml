pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property real height: 20
    readonly property real fontSize: 12

    readonly property color fgColor: "#ffffff"
    readonly property color bgColor: "#2a2a2f"
    readonly property color bdColor: "#3d3d42"
    readonly property color shadowColor: "#000000"

    readonly property real fgOpacity: 0.75
    readonly property real bgOpacity: 1
    readonly property real shadowOpacity: 0.25

    readonly property real animationDuration: 100
}
