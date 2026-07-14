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

    readonly property bool withBackdrop: {
        return NiriService.overviewOpened                           //
        || (hoverHandler.hovered                                    //
            && !IpcService.barExpanded                              //
            && hasActiveWindow                                      //
            && (yAnimation.running || loader.y === 0));             //
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
            visible: barWindow.withBackdrop
            color: BarTheme.backdropColor
            opacity: BarTheme.backdropOpacity
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
