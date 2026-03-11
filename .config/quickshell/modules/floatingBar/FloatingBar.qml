import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.themes

Scope {
    id: root

    property alias screen: floatingBarWindow.screen
    property bool collapsed: false

    PanelWindow { // qmllint disable uncreatable-type
        id: floatingBarWindow
        implicitHeight: FloatingBarTheme.height + 16
        color: "transparent"

        exclusionMode: ExclusionMode.Normal
        exclusiveZone: 0
        mask: Region {}

        anchors {
            top: true
            left: true
            right: true
        }

        margins { // qmllint disable unqualified unresolved-type
            top: 1  // qmllint disable missing-property
            left: 5  // qmllint disable missing-property
            right: 5  // qmllint disable missing-property
        }

        Loader {
            id: loader
            anchors.fill: parent
            anchors.margins: 8
            opacity: root.collapsed ? 0 : 1

            sourceComponent: FlexboxLayout {
                anchors.fill: parent
                justifyContent: FlexboxLayout.JustifyEnd
                alignItems: FlexboxLayout.AlignCenter
                gap: 6

                FloatingVolumeWidget {}
                FloatingBrightnessWidget {}
                FloatingClockWidget {}
            }

            Behavior on opacity {
                NumberAnimation {
                    duration: FloatingBarTheme.animationDuration

                    onRunningChanged: {
                        if (loader.opacity === 0) {
                            loader.active = running;
                            floatingBarWindow.visible = running;
                        }
                    }
                }
            }
        }
    }
}
