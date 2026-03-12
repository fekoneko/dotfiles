pragma ComponentBehavior: Bound

import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import qs.themes

Loader {
    id: root
    opacity: showOnChange ? 0 : 1
    active: !showOnChange
    visible: active

    property bool showOnChange: false
    property string icon
    property real iconSize: root.icon ? FloatingBarTheme.iconSize : 0
    property string text
    property string secondaryText
    property string hoverText
    property real maxTextWidth: 150
    property real leftPadding: 7
    property real rightPadding: 7
    property bool actionsEnabled: false

    onTextChanged: showOnChange && showTimer.restart()
    onIconChanged: showOnChange && showTimer.restart()

    signal mainAction
    signal secondaryAction

    sourceComponent: Rectangle {
        implicitHeight: FloatingBarTheme.height
        color: "transparent"

        implicitWidth: {
            let contentWidth = root.icon ? iconImage.implicitSize : 0;
            contentWidth += root.text ? textItem.contentWidth : 0;
            contentWidth += root.secondaryText ? secondaryTextItem.contentWidth : 0;
            let gap = (root.icon ? 4 : 0) + (root.text ? 4 : 0) + (root.secondaryText ? 4 : 0);
            gap = Math.max(gap - 4, 0);

            return contentWidth + gap + root.leftPadding + root.rightPadding;
        }

        HoverHandler {
            id: hoverHandler
            enabled: root.actionsEnabled || root.hoverText
            cursorShape: Qt.PointingHandCursor
        }

        TapHandler {
            id: mainTapHandler
            enabled: root.actionsEnabled
            acceptedButtons: Qt.LeftButton
            onTapped: root.mainAction()
        }

        TapHandler {
            id: secondaryTapHandler
            enabled: root.actionsEnabled
            acceptedButtons: Qt.RightButton
            onTapped: root.secondaryAction()
        }

        RectangularShadow {
            anchors.fill: parent
            offset.y: 1
            color: FloatingBarTheme.shadowColor
            opacity: FloatingBarTheme.shadowOpacity
            radius: 4
        }

        Rectangle {
            anchors.fill: parent
            color: {
                if (mainTapHandler.pressed || secondaryTapHandler.pressed)
                    return FloatingBarTheme.bgPressedColor;
                if (hoverHandler.hovered)
                    return FloatingBarTheme.bgHoverColor;
                return FloatingBarTheme.bgColor;
            }
            opacity: {
                if (mainTapHandler.pressed || secondaryTapHandler.pressed)
                    return FloatingBarTheme.bgPressedOpacity;
                if (hoverHandler.hovered)
                    return FloatingBarTheme.bgHoverOpacity;
                return FloatingBarTheme.bgOpacity;
            }
            border.color: FloatingBarTheme.bdColor
            border.width: 1.5
            radius: 4

            Behavior on color {
                ColorAnimation {
                    duration: FloatingBarTheme.animationDuration
                }
            }

            Behavior on opacity {
                NumberAnimation {
                    duration: FloatingBarTheme.animationDuration
                }
            }
        }

        FlexboxLayout {
            id: layout
            anchors.fill: parent
            anchors.leftMargin: root.leftPadding
            alignItems: FlexboxLayout.AlignCenter
            gap: 4

            IconImage {
                id: iconImage
                visible: !!root.icon
                implicitSize: root.iconSize
                source: root.icon
                opacity: FloatingBarTheme.fgOpacity
            }

            Rectangle {
                Layout.fillWidth: true
                height: FloatingBarTheme.height
                color: "transparent"

                FlexboxLayout {
                    visible: !!root.text || !!root.secondaryText
                    height: FloatingBarTheme.height
                    justifyContent: FlexboxLayout.JustifyCenter
                    alignItems: FlexboxLayout.AlignCenter
                    gap: 4
                    opacity: hoverHandler.hovered ? 0 : 1

                    Rectangle {
                        visible: !!root.text
                        implicitWidth: textItem.contentWidth
                        implicitHeight: textItem.contentHeight
                        color: "transparent"

                        Text {
                            id: textItem
                            text: root.text
                            textFormat: Text.PlainText
                            maximumLineCount: 1
                            color: FloatingBarTheme.fgColor
                            opacity: FloatingBarTheme.fgOpacity
                            font.pixelSize: FloatingBarTheme.fontSize
                            font.weight: Font.Bold
                            elide: Text.ElideRight
                            width: root.secondaryText ? root.maxTextWidth / 2 : root.maxTextWidth
                        }
                    }

                    Rectangle {
                        visible: !!root.secondaryText
                        implicitWidth: secondaryTextItem.contentWidth
                        implicitHeight: secondaryTextItem.contentHeight
                        color: "transparent"

                        Text {
                            id: secondaryTextItem
                            text: root.secondaryText
                            textFormat: Text.PlainText
                            maximumLineCount: 1
                            color: FloatingBarTheme.fgColor
                            opacity: FloatingBarTheme.fgOpacity
                            font.pixelSize: FloatingBarTheme.fontSize
                            font.weight: Font.Normal
                            elide: Text.ElideRight
                            width: root.text ? root.maxTextWidth / 2 : root.maxTextWidth
                        }
                    }

                    Behavior on opacity {
                        NumberAnimation {
                            duration: FloatingBarTheme.animationDuration
                        }
                    }
                }

                Text {
                    visible: !!root.hoverText
                    anchors.fill: parent
                    anchors.leftMargin: !!root.text && !!root.secondaryText ? -2 : 0
                    anchors.rightMargin: root.rightPadding - anchors.leftMargin
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: root.hoverText
                    textFormat: Text.PlainText
                    maximumLineCount: 1
                    color: FloatingBarTheme.fgColor
                    opacity: hoverHandler.hovered ? FloatingBarTheme.fgOpacity : 0
                    font.pixelSize: FloatingBarTheme.fontSize
                    font.weight: Font.Bold
                    elide: Text.ElideRight
                    width: root.maxTextWidth

                    Behavior on opacity {
                        NumberAnimation {
                            duration: FloatingBarTheme.animationDuration
                        }
                    }
                }
            }
        }
    }

    Timer {
        id: showTimer
        interval: blockShowTimer.running ? 0 : 1000
        onRunningChanged: root.opacity = running ? 1 : 0
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
                if (root.opacity === 0)
                    root.active = running;
            }
        }
    }
}
