import QtQuick
import qs.services
import qs.themes

Rectangle {
    color: "transparent"
    implicitWidth: BarTheme.maxWindowTitleWidth
    height: BarTheme.height

    Text {
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        text: NiriService.activeWindowByScreen(barWindow.screen.name)?.title ?? "" // qmllint disable unqualified
        textFormat: Text.PlainText
        maximumLineCount: 1
        color: BarTheme.fgColor
        opacity: BarTheme.fgSecondaryOpacity
        font.pixelSize: BarTheme.fontSize
        elide: Text.ElideMiddle
        width: parent.width
    }
}
