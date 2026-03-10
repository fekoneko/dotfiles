import Quickshell
import QtQuick
import QtQuick.Effects
import qs.services
import qs.themes

PanelWindow { // qmllint disable uncreatable-type
    id: root
    color: "transparent"
    implicitWidth: text.contentWidth + 26
    implicitHeight: text.contentHeight + 20
    margins.right: 5 // qmllint disable

    anchors {
        top: true
        right: true
    }

    mask: Region {}

    Rectangle {
        id: inner
        color: "transparent"
        anchors.fill: parent
        anchors.margins: 8
        opacity: barWindow.isCollapsed ? 1 : 0 // qmllint disable unqualified

        RectangularShadow {
            anchors.fill: parent
            offset.y: 1
            color: BarTheme.shadowColor
            opacity: BarTheme.shadowOpacity
            radius: 4
        }

        Rectangle {
            anchors.fill: parent
            color: BarTheme.floatingBgColor
            opacity: BarTheme.floatingBgOpacity
            border.color: BarTheme.floatingBdColor
            border.width: 1
            radius: 4
        }

        Text {
            id: text
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            text: TimeService.formattedTime
            color: BarTheme.floatingFgColor
            opacity: BarTheme.floatingFgOpacity
            font.pixelSize: BarTheme.fontSize
            font.weight: Font.Bold
        }

        Behavior on opacity {
            NumberAnimation {
                duration: BarTheme.animationDuration

                onRunningChanged: {
                    if (inner.opacity === 0)
                        root.visible = running;
                }
            }
        }
    }
}
