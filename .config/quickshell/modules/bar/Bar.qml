import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.themes

PanelWindow { // qmllint disable uncreatable-type
    id: barWindow
    implicitHeight: BarTheme.height
    margins.top: collapsed ? 5 - implicitHeight : 0 // qmllint disable
    color: "transparent"

    readonly property bool collapsed: {
        const collapsed = IpcService.barCollapsed;
        const hovered = hoverHandler.hovered;
        const hasActiveWindow = !!NiriService.activeWindowByScreen(screen.name);
        return collapsed && !hovered && hasActiveWindow;
    }

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

    HoverHandler {
        id: hoverHandler
    }

    Behavior on margins.top {
        NumberAnimation {
            duration: BarTheme.animationDuration

            onRunningChanged: {
                if (barWindow.margins.top < 0) // qmllint disable unqualified
                    loader.active = running; // qmllint disable unqualified
            }
        }
    }
}
