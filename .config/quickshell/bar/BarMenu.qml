import Quickshell
import QtQuick
import QtQuick.Layouts

PopupWindow {
  required property QsMenuHandle menuHandle
  anchor.window: barWindow
  implicitWidth: 150
  implicitHeight: 200

  FlexboxLayout {
    anchors.fill: parent
    direction: FlexboxLayout.Column

    QsMenuOpener {
      id: menuOpener
      menu: menuHandle
    }

    Repeater {
      model: menuOpener.children

      MouseArea {
        required property QsMenuEntry modelData
        Layout.fillWidth: true
        implicitHeight: 24
        onClicked: modelData.triggered()

        Text {
          text: modelData.text
        }
      }
    }
  }
}
