import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.themes

Variants {
    model: Quickshell.screens

    PanelWindow { // qmllint disable uncreatable-type
        id: barWindow
        screen: modelData
        implicitHeight: BarTheme.height
        margins.top: isCollapsed ? 5 - implicitHeight : 0 // qmllint disable
        color: "transparent"

        anchors {
            top: true
            left: true
            right: true
        }

        required property ShellScreen modelData

        readonly property bool isCollapsed: {
            const isCollapsed = IpcService.barCollapsed;
            const isHovered = hoverHandler.hovered;
            const hasActiveWindow = !!NiriService.activeWindowByScreen(modelData.name);
            return isCollapsed && !isHovered && hasActiveWindow;
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

        FloatingClock {}

        HoverHandler {
            id: hoverHandler
        }

        Behavior on margins.top {
            NumberAnimation {
                duration: BarTheme.animationDuration

                onRunningChanged: {
                    if (margins.top < 0) // qmllint disable
                        loader.active = running; // qmllint disable unqualified
                }
            }
        }
    }
}
