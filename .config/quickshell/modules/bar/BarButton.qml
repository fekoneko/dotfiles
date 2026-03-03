import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import qs.themes

Rectangle {
    id: root
    color: "transparent"
    implicitWidth: iconImage.implicitSize + textItem.contentWidth + 14 + (iconImage.implicitSize && text ? 5 : 0)
    implicitHeight: BarTheme.height

    property bool active: false
    property string icon
    property alias iconSize: iconImage.implicitSize
    property alias text: textItem.text
    property color fgColor: BarTheme.fgColor
    property real fgOpacity: BarTheme.fgPrimaryOpacity

    signal mainAction
    signal secondaryAction

    HoverHandler {
        id: hoverHandler
        cursorShape: Qt.PointingHandCursor
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
        color: BarTheme.bgColor
        opacity: {
            if (mainTapHandler.pressed || secondaryTapHandler.pressed)
                return BarTheme.bgPressedOpacity;
            if (root.active)
                return BarTheme.bgActiveOpacity;
            if (hoverHandler.hovered)
                return BarTheme.bgHoverOpacity;
            return 0;
        }
        radius: 4

        Behavior on opacity {
            NumberAnimation {
                duration: BarTheme.animationFast
            }
        }
    }

    FlexboxLayout {
        anchors.fill: parent
        anchors.leftMargin: root.icon ? 7 : 2
        alignItems: FlexboxLayout.AlignCenter
        gap: 5

        IconImage {
            id: iconImage
            enabled: !!root.icon
            source: root.icon
            opacity: root.fgOpacity
            implicitSize: root.icon ? 12 : 0
        }

        Text {
            id: textItem
            enabled: !!root.text
            color: root.fgColor
            opacity: root.fgOpacity
            font.pixelSize: BarTheme.fontSize
            font.weight: Font.Bold
        }
    }
}
