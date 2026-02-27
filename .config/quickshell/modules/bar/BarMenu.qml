// TODO: switch to universal dmenu for everything

import Quickshell
import QtQuick
import QtQuick.Layouts

PopupWindow {
    id: root
    anchor.window: barWindow // qmllint disable unqualified
    implicitWidth: 150
    implicitHeight: 200

    required property QsMenuHandle menuHandle

    FlexboxLayout {
        anchors.fill: parent
        direction: FlexboxLayout.Column

        QsMenuOpener {
            id: menuOpener
            menu: root.menuHandle
        }

        Repeater {
            model: menuOpener.children

            MouseArea {
                id: menuItem
                Layout.fillWidth: true
                implicitHeight: 24
                onClicked: modelData.triggered()

                required property QsMenuEntry modelData

                Text {
                    text: menuItem.modelData.text
                }
            }
        }
    }
}
