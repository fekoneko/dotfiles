import Quickshell
import QtQuick
import QtQuick.Effects
import qs.services
import qs.themes

PanelWindow { // qmllint disable uncreatable-type
    id: root
    color: "transparent"
    implicitWidth: floatingClockText.contentWidth + 26
    implicitHeight: floatingClockText.contentHeight + 20
    margins.right: 5 // qmllint disable

    anchors {
        top: true
        right: true
    }

    mask: Region {}

    Rectangle {
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
            id: floatingClockText
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
                    if (opacity === 0) // qmllint disable unqualified
                        root.visible = running;
                }
            }
        }
    }
}
