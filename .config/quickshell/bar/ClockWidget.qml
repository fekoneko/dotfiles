import QtQuick
import qs.singletons

Text {
  text: Time.time
  color: Theme.bar.fgPrimaryColor
  opacity: Theme.bar.fgPrimaryOpacity
  font.pixelSize: Theme.bar.fontSize
  font.weight: Font.Bold
}
