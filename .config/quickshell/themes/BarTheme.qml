pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property real height: 24
    readonly property real fontSize: 12
    readonly property real windowTitleWidth: 500

    readonly property color fgColor: "#ffffff"
    readonly property color bgColor: "#ffffff"

    readonly property real fgPrimaryOpacity: 0.8
    readonly property real fgSecondaryOpacity: 0.6
    readonly property real bgHoverOpacity: 0.1
    readonly property real bgPressedOpacity: 0.2
    readonly property real bgActiveOpacity: 0.1

    readonly property real animationDuration: 100
}
