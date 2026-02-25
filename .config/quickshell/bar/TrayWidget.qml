import Quickshell.Widgets
import Quickshell.Services.SystemTray
import QtQuick

Repeater {
  model: SystemTray.items

  MouseArea {
    required property SystemTrayItem modelData
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    implicitWidth: 32
    implicitHeight: 24

    onClicked: ({ button, x, y }) => {
      if (button === Qt.LeftButton) modelData.activate();
      else barMenu.visible = true;
    }

    IconImage {
      anchors.centerIn: parent
      source: modelData.icon
      implicitSize: 16
    }

    BarMenu {
      id: barMenu
      menuHandle: modelData.menu
    }
  }
}
