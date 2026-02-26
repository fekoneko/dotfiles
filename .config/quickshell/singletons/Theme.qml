pragma Singleton

import Quickshell
import QtQuick

Singleton {
  readonly property QtObject bar: QtObject {
    property color fgPrimaryColor: "#ffffff"
    property real fgPrimaryOpacity: 0.8
    property color fgTertiaryColor: "#ffffff"
    property real fgTertiaryOpacity: 0.6
    property color bgHoverColor: "#ffffff"
    property real bgHoverOpacity: 0.1
    property int fontSize: 12
  }
}
