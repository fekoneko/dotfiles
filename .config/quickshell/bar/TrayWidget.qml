import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts

Repeater {
  model: SystemTray.items

  MouseArea {
    hoverEnabled: true
    implicitWidth: 32
    implicitHeight: 24

    onClicked: modelData.activate()

    Image {
      anchors.centerIn: parent
      source: modelData.icon
      width: 16
      height: 16
    }
  }
}
