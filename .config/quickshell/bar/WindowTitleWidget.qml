import QtQuick
import qs.singletons

Text {
  text: Niri.activeWindowByScreen(barWindow.screen.name)?.title ?? ""
  color: Theme.bar.fgTertiaryColor
  opacity: Theme.bar.fgTertiaryOpacity
  font.pixelSize: Theme.bar.fgTertiaryColor
}
