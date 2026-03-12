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
    property real iconSize: loader.icon ? FloatingBarTheme.iconSize : 0
    property string text
    property string secondaryText
    property real maxTextWidth: 150
    property real paddingLeft: 7
    property real paddingRight: 7

    onTextChanged: showOnChange && showTimer.restart()
    onIconChanged: showOnChange && showTimer.restart()

    sourceComponent: Rectangle {
        implicitWidth: {
            let contentWidth = loader.icon ? iconImage.implicitSize : 0;
            contentWidth += loader.text ? textItem.contentWidth : 0;
            contentWidth += loader.secondaryText ? secondaryTextItem.contentWidth : 0;
            let gap = (loader.icon ? 4 : 0) + (loader.text ? 4 : 0) + (loader.secondaryText ? 4 : 0);
            gap = Math.max(gap - 4, 0);
            return contentWidth + gap + loader.paddingLeft + loader.paddingRight;
        }
        implicitHeight: FloatingBarTheme.height
        color: "transparent"

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
            border.width: 1.5
            radius: 4
        }

        FlexboxLayout {
            id: layout
            anchors.fill: parent
            anchors.leftMargin: loader.paddingLeft
            alignItems: FlexboxLayout.AlignCenter
            gap: 4

            IconImage {
                id: iconImage
                visible: !!loader.icon
                implicitSize: loader.iconSize
                source: loader.icon
                opacity: FloatingBarTheme.fgOpacity
            }

            Rectangle {
                visible: !!loader.text
                implicitWidth: textItem.contentWidth
                implicitHeight: textItem.contentHeight
                color: "transparent"

                Text {
                    id: textItem
                    text: loader.text
                    textFormat: Text.PlainText
                    maximumLineCount: 1
                    color: FloatingBarTheme.fgColor
                    opacity: FloatingBarTheme.fgOpacity
                    font.pixelSize: FloatingBarTheme.fontSize
                    font.weight: Font.Bold
                    elide: Text.ElideRight
                    width: loader.secondaryText ? loader.maxTextWidth / 2 : loader.maxTextWidth
                }
            }

            Rectangle {
                visible: !!loader.secondaryText
                implicitWidth: secondaryTextItem.contentWidth
                implicitHeight: secondaryTextItem.contentHeight
                color: "transparent"

                Text {
                    id: secondaryTextItem
                    text: loader.secondaryText
                    textFormat: Text.PlainText
                    maximumLineCount: 1
                    color: FloatingBarTheme.fgColor
                    opacity: FloatingBarTheme.fgOpacity
                    font.pixelSize: FloatingBarTheme.fontSize
                    font.weight: Font.Normal
                    elide: Text.ElideRight
                    width: loader.text ? loader.maxTextWidth / 2 : loader.maxTextWidth
                }
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
