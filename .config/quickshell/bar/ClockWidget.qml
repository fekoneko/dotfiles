import QtQuick
import qs.singletons

Text {
  text: Time.time
  color: Theme.bar.fgColor
  font.pixelSize: Theme.bar.fontSize
  font.weight: Font.Bold
}
