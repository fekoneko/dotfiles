import Quickshell
import QtQuick
import QtQuick.Effects
import qs.services
import qs.themes

PopupWindow {
    anchor.window: barWindow // qmllint disable unqualified
    anchor.rect.x: barWindow.width - width // qmllint disable unqualified
    anchor.rect.y: barWindow.height // qmllint disable unqualified
    implicitWidth: floatingClockText.contentWidth + 26
    implicitHeight: floatingClockText.contentHeight + 20
    color: "transparent"

    mask: Region {}

    RectangularShadow {
        anchors.centerIn: parent
        implicitWidth: floatingClockText.contentWidth + 10
        implicitHeight: floatingClockText.contentHeight + 4
        offset.y: 1
        color: BarTheme.shadowColor
        opacity: BarTheme.shadowOpacity
        radius: 4
    }

    Rectangle {
        anchors.centerIn: parent
        implicitWidth: floatingClockText.contentWidth + 10
        implicitHeight: floatingClockText.contentHeight + 4
        color: BarTheme.floatingBgColor
        opacity: BarTheme.floatingBgOpacity
        border.color: BarTheme.floatingBdColor
        border.width: 1
        radius: 4
    }

    Text {
        id: floatingClockText
        anchors.centerIn: parent
        text: TimeService.formattedTime
        color: BarTheme.floatingFgColor
        opacity: BarTheme.floatingFgOpacity
        font.pixelSize: BarTheme.fontSize
        font.weight: Font.Bold
    }
}
