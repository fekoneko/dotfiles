pragma ComponentBehavior: Bound

import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import qs.themes

Loader {
    id: loader
    opacity: showOnChange ? 0 : 1
    active: !showOnChange
    visible: active

    property bool showOnChange: false
    property string icon
    property real iconSize: loader.icon ? 11 : 0
    property string text
    property color fgColor: FloatingBarTheme.fgColor
    property real fgOpacity: FloatingBarTheme.fgOpacity

    onTextChanged: showOnChange && showTimer.restart()
    onIconChanged: showOnChange && showTimer.restart()

    sourceComponent: Rectangle {
        implicitWidth: {
            const contentWidth = iconImage.implicitSize + textItem.contentWidth;
            const gap = iconImage.implicitSize && loader.text ? 5 : 0;
            const paddings = 10;
            return contentWidth + gap + paddings;
        }
        implicitHeight: FloatingBarTheme.height
        color: "transparent"
        opacity: FloatingBarTheme.bgOpacity

        RectangularShadow {
            anchors.fill: parent
            offset.y: 1
            color: FloatingBarTheme.shadowColor
            opacity: FloatingBarTheme.shadowOpacity
            radius: 4
        }

        Rectangle {
            anchors.fill: parent
            color: FloatingBarTheme.bgColor
            opacity: FloatingBarTheme.bgOpacity
            border.color: FloatingBarTheme.bdColor
            border.width: 1
            radius: 4
        }

        FlexboxLayout {
            anchors.fill: parent
            anchors.leftMargin: 5
            alignItems: FlexboxLayout.AlignCenter
            gap: 5

            IconImage {
                id: iconImage
                visible: !!loader.icon
                implicitSize: loader.iconSize
                source: loader.icon
                opacity: loader.fgOpacity
            }

            Text {
                id: textItem
                visible: !!loader.text
                text: loader.text
                textFormat: Text.PlainText
                color: loader.fgColor
                opacity: loader.fgOpacity
                font.pixelSize: FloatingBarTheme.fontSize
                font.weight: Font.Bold
            }
        }
    }

    Timer {
        id: showTimer
        interval: blockShowTimer.running ? 0 : 1000
        onRunningChanged: loader.opacity = running ? 1 : 0
    }

    Timer {
        // Block showing right after component creation even if change events are emitted
        id: blockShowTimer
        interval: 100
        running: true
    }

    Behavior on opacity {
        NumberAnimation {
            duration: FloatingBarTheme.animationDuration

            onRunningChanged: {
                if (loader.opacity === 0)
                    loader.active = running;
            }
        }
    }
}
