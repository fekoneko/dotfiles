import QtQuick
import qs.singletons

Text {
  text: Time.time
  color: Theme.barFgColor
  font.pixelSize: Theme.barFontSize
  font.weight: Font.Bold
}
