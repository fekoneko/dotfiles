import Quickshell.Widgets
import QtQuick
import qs.themes

Rectangle {
    id: root
    color: "transparent"
    implicitWidth: 32
    implicitHeight: 24

    property alias icon: iconImage.source

    signal mainAction
    signal secondaryAction

    HoverHandler {
        id: hoverHandler
    }

    TapHandler {
        id: mainTapHandler
        acceptedButtons: Qt.LeftButton
        onTapped: root.mainAction()
    }

    TapHandler {
        id: secondaryTapHandler
        acceptedButtons: Qt.RightButton
        onTapped: root.secondaryAction()
    }

    Rectangle {
        anchors.fill: parent
        color: hoverHandler.hovered ? BarTheme.bgHoverColor : "transparent"
        opacity: hoverHandler.hovered ? BarTheme.bgHoverOpacity : 0
        radius: 4
    }

    IconImage {
        id: iconImage
        anchors.centerIn: parent
        source: root.icon
        opacity: BarTheme.fgPrimaryOpacity
        implicitSize: 16
    }
}
