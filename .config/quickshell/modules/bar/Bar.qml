import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.themes

PanelWindow { // qmllint disable uncreatable-type
    id: barWindow
    implicitHeight: BarTheme.height
    color: "transparent"

    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.namespace: "bar"
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

    exclusionMode: ExclusionMode.Normal
    exclusiveZone: IpcService.barExpanded ? BarTheme.height - 5 : 0
    mask: Region {
        item: loader
    }

    readonly property bool hasActiveWindow: !!NiriService.activeWindowByScreen(screen.name)

    readonly property bool revealed: {
        return IpcService.barExpanded //
        || hoverHandler.hovered       //
        || NiriService.overviewOpened //
        || !hasActiveWindow;          //
    }

    readonly property bool panelMode: {
        return IpcService.barExpanded || (!NiriService.overviewOpened && !hasActiveWindow);
    }

    anchors {
        top: true
        left: true
        right: true
    }

    Loader {
        id: loader
        x: 0
        y: barWindow.revealed ? 0 : 5 - barWindow.height
        width: barWindow.width
        height: barWindow.height

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
                DndWidget {}
                MicrophoneWidget {}
                VolumeWidget {}
                BrightnessWidget {}
                ClockWidget {}
            }
        }

        Rectangle {
            anchors.fill: parent
            color: "transparent"

            Rectangle {
                anchors.fill: parent
                opacity: barWindow.revealed && barWindow.panelMode ? BarTheme.panelOpacity : 0

                gradient: Gradient {
                    stops: [
                        GradientStop {
                            color: BarTheme.panelColor
                            position: 0
                        },
                        GradientStop {
                            color: "transparent"
                            position: 1
                        }
                    ]
                }

                Behavior on opacity {
                    NumberAnimation {
                        duration: BarTheme.animationDuration
                    }
                }
            }

            Rectangle {
                anchors.fill: parent
                color: BarTheme.overlayColor
                opacity: barWindow.revealed && !barWindow.panelMode ? BarTheme.overlayOpacity : 0

                Behavior on opacity {
                    NumberAnimation {
                        duration: BarTheme.animationDuration
                    }
                }
            }
        }

        Behavior on y {
            NumberAnimation {
                id: yAnimation
                duration: BarTheme.animationDuration

                onRunningChanged: {
                    if (loader.y < 0) // qmllint disable unqualified
                        loader.active = running; // qmllint disable unqualified
                }
            }
        }
    }

    HoverHandler {
        id: hoverHandler
    }
}
