import QtQuick
import qs.services
import qs.themes

Text {
    text: TimeService.time
    color: BarTheme.fgPrimaryColor
    opacity: BarTheme.fgPrimaryOpacity
    font.pixelSize: BarTheme.fontSize
    font.weight: Font.Bold
}
