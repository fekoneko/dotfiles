import Quickshell
import Quickshell.Widgets
import QtQuick.Layouts

Variants {
  model: Quickshell.screens

  PanelWindow {
    required property var modelData

    screen: modelData
    color: "transparent"
    implicitHeight: 24

    anchors {
      top: true
      left: true
      right: true
    }

    MarginWrapperManager {
      leftMargin: 8
      rightMargin: 8
    }

    RowLayout {
      uniformCellSizes: true

      FlexboxLayout {
        Layout.fillWidth: true
        justifyContent: FlexboxLayout.JustifyStart
        alignItems: FlexboxLayout.AlignCenter

        TrayWidget {}
      }

      FlexboxLayout {
        Layout.fillWidth: true
        justifyContent: FlexboxLayout.JustifyCenter
        alignItems: FlexboxLayout.AlignCenter
      }

      FlexboxLayout {
        Layout.fillWidth: true
        justifyContent: FlexboxLayout.JustifyEnd
        alignItems: FlexboxLayout.AlignCenter

        ClockWidget {}
      }
    }
  }
}
