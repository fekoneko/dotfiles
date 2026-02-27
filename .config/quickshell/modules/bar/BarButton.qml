import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import qs.themes

Rectangle {
    id: root
    color: "transparent"
    implicitWidth: layout.implicitWidth + 14 + (icon && text ? layout.gap : 0)
    implicitHeight: 24

    property string icon
    property alias iconSize: iconImage.implicitSize
    property alias text: textComponent.text

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
        color: {
            if (mainTapHandler.pressed || secondaryTapHandler.pressed)
                return BarTheme.bgPressedColor;
            if (hoverHandler.hovered)
                return BarTheme.bgHoverColor;
            return "transparent";
        }
        opacity: {
            if (mainTapHandler.pressed || secondaryTapHandler.pressed)
                return BarTheme.bgPressedOpacity;
            if (hoverHandler.hovered)
                return BarTheme.bgHoverOpacity;
            return 0;
        }
        radius: 4
    }

    FlexboxLayout {
        id: layout
        anchors.fill: parent
        anchors.leftMargin: root.icon ? 7 : 2
        alignItems: FlexboxLayout.AlignCenter
        gap: 5

        IconImage {
            id: iconImage
            enabled: !!root.icon
            source: root.icon
            opacity: BarTheme.fgPrimaryOpacity
            implicitSize: root.icon ? 12 : 0
        }

        Text {
            id: textComponent
            enabled: !!root.text
            color: BarTheme.fgPrimaryColor
            opacity: BarTheme.fgPrimaryOpacity
            font.pixelSize: BarTheme.fontSize
            font.weight: Font.Bold
        }
    }
}
