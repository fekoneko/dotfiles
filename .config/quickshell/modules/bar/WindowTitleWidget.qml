import QtQuick
import qs.services
import qs.themes

Text {
    text: NiriService.activeWindowByScreen(barWindow.screen.name)?.title ?? "" // qmllint disable unqualified
    color: BarTheme.fgTertiaryColor
    opacity: BarTheme.fgTertiaryOpacity
    font.pixelSize: BarTheme.fontSize
}
