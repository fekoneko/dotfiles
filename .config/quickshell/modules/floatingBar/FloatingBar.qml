import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.themes

PanelWindow { // qmllint disable uncreatable-type
    id: floatingBarWindow
    implicitHeight: FloatingBarTheme.height + 16
    color: "transparent"

    exclusionMode: ExclusionMode.Normal
    exclusiveZone: 0
    mask: Region {
        item: notificationsWidget.visible ? notificationsWidget : null
    }

    anchors {
        top: true
        left: true
        right: true
    }

    margins { // qmllint disable unqualified unresolved-type
        top: 2  // qmllint disable missing-property
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
        opacity: !barWindow.collapsed ? 0 : 1 // qmllint disable unqualified

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
        opacity: !barWindow.collapsed ? 0 : 1 // qmllint disable unqualified

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
}
