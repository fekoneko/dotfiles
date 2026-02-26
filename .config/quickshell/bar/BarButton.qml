import Quickshell.Widgets
import QtQuick
import qs.singletons

Rectangle {
  property alias icon: iconImage.source
  color: "transparent"
  implicitWidth: 32
  implicitHeight: 24

  signal mainAction()
  signal secondaryAction()

  HoverHandler { id: hoverHandler }

  TapHandler {
    id: mainTapHandler
    acceptedButtons: Qt.LeftButton
    onTapped: mainAction()
  }

  TapHandler {
    id: secondaryTapHandler
    acceptedButtons: Qt.RightButton
    onTapped: secondaryAction()
  }

  Rectangle {
    anchors.fill: parent
    color: hoverHandler.hovered ? Theme.bar.bgHoverColor : "transparent"
    opacity: hoverHandler.hovered ? Theme.bar.bgHoverOpacity : 0
    radius: 4
  }

  IconImage {
    id: iconImage
    anchors.centerIn: parent
    source: modelData.icon
    opacity: Theme.bar.fgPrimaryOpacity
    implicitSize: 16
  }
}
