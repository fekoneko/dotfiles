import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.themes
import qs.services

Variants {
    model: Quickshell.screens

    PanelWindow { // qmllint disable uncreatable-type
        id: barWindow
        screen: modelData
        color: "transparent"
        implicitHeight: BarTheme.height
        margins.top: IpcService.barCollapsed && !hoverHandler.hovered ? -implicitHeight + 5 : 0 // qmllint disable

        required property ShellScreen modelData

        anchors {
            top: true
            left: true
            right: true
        }

        Loader {
            id: loader
            anchors.fill: parent

            sourceComponent: RowLayout {
                uniformCellSizes: true
                height: BarTheme.height

                FlexboxLayout {
                    Layout.fillWidth: true
                    justifyContent: FlexboxLayout.JustifyStart
                    alignItems: FlexboxLayout.AlignCenter

                    BatteryWidget {}
                    CpuWidget {}
                    MemoryWidget {}
                    TaskbarWidget {}
                    TrayWidget {}
                }

                FlexboxLayout {
                    Layout.fillWidth: true
                    justifyContent: FlexboxLayout.JustifyCenter
                    alignItems: FlexboxLayout.AlignCenter

                    WindowTitleWidget {}
                }

                FlexboxLayout {
                    Layout.fillWidth: true
                    justifyContent: FlexboxLayout.JustifyEnd
                    alignItems: FlexboxLayout.AlignCenter

                    AnkiWidget {}
                    NetworkWidget {}
                    BluetoothWidget {}
                    MicrophoneWidget {}
                    VolumeWidget {}
                    BrightnessWidget {}
                    ClockWidget {}
                }
            }
        }

        FloatingClock {
            visible: !loader.active
        }

        HoverHandler {
            id: hoverHandler
        }

        Behavior on margins.top {
            NumberAnimation {
                duration: BarTheme.animationDuration

                onRunningChanged: {
                    if (barWindow.margins.top !== 0) // qmllint disable unqualified
                        loader.active = running; // qmllint disable unqualified
                }
            }
        }
    }
}
