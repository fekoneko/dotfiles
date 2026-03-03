import Quickshell.Io
import QtQuick
import qs.services
import qs.themes

BarButton {
    text: AnkiService.randomWord
    fgOpacity: BarTheme.fgTertiaryOpacity
    onMainAction: AnkiService.refreshRandomWord()
    onSecondaryAction: process.startDetached()

    Process {
        id: process
        command: ["anki"]
    }
}
