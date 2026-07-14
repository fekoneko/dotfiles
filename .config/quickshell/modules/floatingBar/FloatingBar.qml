import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.themes

PanelWindow { // qmllint disable uncreatable-type
    id: floatingBarWindow
    implicitHeight: FloatingBarTheme.height + 16
    color: "transparent"

    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.namespace: "floating-bar"
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

    exclusionMode: ExclusionMode.Ignore
    mask: Region {
        item: notificationsWidget.visible ? notificationsWidget : null
    }

    anchors {
        top: true
        left: true
        right: true
    }

    margins { // qmllint disable unqualified unresolved-type
        top: barWindow.revealed ? BarTheme.height + 1 : 6  // qmllint disable unqualified missing-property
        left: 6  // qmllint disable missing-property
        right: 6  // qmllint disable missing-property
    }

    FlexboxLayout {
        anchors.fill: parent
        anchors.margins: 8
        justifyContent: FlexboxLayout.JustifyStart
        alignItems: FlexboxLayout.AlignCenter
        gap: 6

        FloatingNotificationsWidget {
            id: notificationsWidget
        }
    }

    Loader {
        id: centerLoader
        anchors.fill: parent
        opacity: barWindow.revealed ? 0 : 1 // qmllint disable unqualified

        sourceComponent: FlexboxLayout {
            anchors.fill: parent
            anchors.margins: 8
            justifyContent: FlexboxLayout.JustifyCenter
            alignItems: FlexboxLayout.AlignCenter
            gap: 6

            FloatingTaskbarWidget {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }

        Behavior on opacity {
            NumberAnimation {
                duration: FloatingBarTheme.animationDurationShort

                onRunningChanged: {
                    if (centerLoader.opacity === 0)
                        centerLoader.active = running;
                }
            }
        }
    }

    Loader {
        id: rightLoader
        anchors.fill: parent
        opacity: barWindow.revealed ? 0 : 1 // qmllint disable unqualified

        sourceComponent: FlexboxLayout {
            anchors.fill: parent
            anchors.margins: 8
            justifyContent: FlexboxLayout.JustifyEnd
            alignItems: FlexboxLayout.AlignCenter
            gap: 6

            FloatingNetworkWidget {}
            FloatingBluetoothWidget {}
            FloatingMicrophoneWidget {}
            FloatingVolumeWidget {}
            FloatingBrightnessWidget {}
            FloatingClockWidget {}
        }

        Behavior on opacity {
            NumberAnimation {
                duration: FloatingBarTheme.animationDurationShort

                onRunningChanged: {
                    if (rightLoader.opacity === 0)
                        rightLoader.active = running;
                }
            }
        }
    }

    Behavior on margins.top {
        NumberAnimation {
            duration: FloatingBarTheme.animationDurationShort
        }
    }
}
