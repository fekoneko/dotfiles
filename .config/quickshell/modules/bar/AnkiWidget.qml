import QtQuick
import qs.services
import qs.themes

BarButton {
    text: AnkiService.randomWord
    fgOpacity: BarTheme.fgSecondaryOpacity
    maxTextWidth: BarTheme.maxAnkiWidth
    onMainAction: AnkiService.showBrowser(AnkiService.randomWord)
    onSecondaryAction: AnkiService.refreshRandomWord()
}
