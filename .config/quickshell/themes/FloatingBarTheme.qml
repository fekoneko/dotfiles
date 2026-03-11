pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property real height: 22
    readonly property real fontSize: 12

    readonly property color fgColor: "#ffffff"
    readonly property color bgColor: "#303035"
    readonly property color bdColor: "#4e4e54"
    readonly property color shadowColor: "#000000"

    readonly property real fgOpacity: 0.75
    readonly property real bgOpacity: 1
    readonly property real shadowOpacity: 0.25

    readonly property real animationDuration: 100
}
