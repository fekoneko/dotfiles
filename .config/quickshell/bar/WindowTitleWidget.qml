import QtQuick
import qs.singletons

Text {
  text: Niri.activeWindowByScreen(barWindow.screen.name)?.title ?? ""
  color: Theme.bar.fgColor
  font.pixelSize: Theme.bar.fontSize
  opacity: 0.6
}
