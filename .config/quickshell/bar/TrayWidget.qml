import Quickshell.Widgets
import Quickshell.Services.SystemTray
import QtQuick

Repeater {
  model: SystemTray.items

  BarButton {
    required property SystemTrayItem modelData
    onMainAction: modelData.activate()
    onSecondaryAction: barMenu.visible = true;

    BarMenu {
      id: barMenu
      menuHandle: modelData.menu
    }
  }
}
