pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property color fgPrimaryColor: "#ffffff"
    readonly property color fgTertiaryColor: "#ffffff"
    readonly property color bgHoverColor: "#ffffff"
    readonly property color bgPressedColor: "#ffffff"

    readonly property real fgPrimaryOpacity: 0.8
    readonly property real fgTertiaryOpacity: 0.6
    readonly property real bgHoverOpacity: 0.1
    readonly property real bgPressedOpacity: 0.2

    readonly property real fontSize: 12
}
