pragma Singleton

import Quickshell
import QtQuick

Singleton {
  readonly property QtObject bar: QtObject {
    property color fgColor: "#ffffff"
    property int fontSize: 12
  }
}
