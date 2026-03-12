import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import qs.themes

Rectangle {
    id: root
    implicitWidth: {
        let contentWidth = (icon ? iconImage.implicitSize : 0) + (text ? textItem.contentWidth : 0);
        const gap = icon && text ? 5 : 0;
        const paddings = 14;
        return contentWidth + gap + paddings;
    }
    implicitHeight: BarTheme.height
    color: "transparent"

    property bool active: false
    property string icon
    property alias iconSize: iconImage.implicitSize
    property alias text: textItem.text
    property color fgColor: BarTheme.fgColor
    property real fgOpacity: BarTheme.fgPrimaryOpacity
    property alias maxTextWidth: textWrapper.implicitWidth

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
                duration: BarTheme.animationDuration
            }
        }
    }

    FlexboxLayout {
        anchors.fill: parent
        anchors.leftMargin: 7
        alignItems: FlexboxLayout.AlignCenter
        gap: 5

        IconImage {
            id: iconImage
            visible: !!root.icon
            source: root.icon
            opacity: root.fgOpacity
            implicitSize: root.icon ? BarTheme.iconSize : 0
        }

        Rectangle {
            id: textWrapper
            implicitWidth: 150
            visible: !!root.text
            color: "transparent"

            Text {
                id: textItem
                anchors.centerIn: parent
                textFormat: Text.PlainText
                maximumLineCount: 1
                color: root.fgColor
                opacity: root.fgOpacity
                font.pixelSize: BarTheme.fontSize
                font.weight: Font.Bold
                elide: Text.ElideRight
                width: parent.width
            }
        }
    }
}
