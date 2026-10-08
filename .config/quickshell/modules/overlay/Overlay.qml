import Quickshell
import Quickshell.Wayland
import QtQuick
import qs.services

PanelWindow { // qmllint disable uncreatable-type
    id: floatingBarWindow
    color: "transparent"

    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.namespace: "overlay"
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

    exclusionMode: ExclusionMode.Ignore
    mask: Region {}

    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    Loader {
        anchors.fill: parent
        active: IpcService.keymapOverlayVisible

        sourceComponent: Rectangle {
            anchors.fill: parent
            color: "transparent"
            opacity: 0.85

            Image {
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    left: parent.left
                }
                source: Quickshell.shellPath("assets/images/keymap-left.png")
                fillMode: Image.PreserveAspectFit
            }

            Image {
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    right: parent.right
                }
                source: Quickshell.shellPath("assets/images/keymap-right.png")
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}
