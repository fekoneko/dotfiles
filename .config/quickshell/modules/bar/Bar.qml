import Quickshell
import Quickshell.Widgets
import QtQuick.Layouts
import qs.themes

Variants {
    model: Quickshell.screens

    PanelWindow { // qmllint disable uncreatable-type
        id: barWindow
        screen: modelData
        color: "transparent"
        implicitHeight: BarTheme.height

        required property ShellScreen modelData

        anchors {
            top: true
            left: true
            right: true
        }

        MarginWrapperManager {
            leftMargin: 1
            rightMargin: 1
        }

        RowLayout {
            uniformCellSizes: true

            FlexboxLayout {
                Layout.fillWidth: true
                justifyContent: FlexboxLayout.JustifyStart
                alignItems: FlexboxLayout.AlignCenter

                BatteryWidget {}
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

                MicrophoneWidget {}
                VolumeWidget {}
                BrightnessWidget {}
                ClockWidget {}
            }
        }
    }
}
