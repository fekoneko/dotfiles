import QtQuick
import qs.singletons

Text {
  text: Niri.focusedWindow?.title ?? ""
  color: Theme.bar.fgColor
  font.pixelSize: Theme.bar.fontSize
  font.weight: Font.Bold
}
