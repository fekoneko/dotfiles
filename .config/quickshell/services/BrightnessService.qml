pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property real brightness: 0
    readonly property string formattedBrightness: Math.round(brightness) + "%"

    readonly property string icon: {
        let icon;
        if (brightness <= 100 / 3) {
            icon = "assets/icons/brightness-low.svg";
        } else if (brightness <= 200 / 3) {
            icon = "assets/icons/brightness-medium.svg";
        } else {
            icon = "assets/icons/brightness-high.svg";
        }
        return "file://" + Quickshell.shellPath(icon);
    }

    Process {
        id: monitorProcess
        running: true
        command: ["udevadm", "monitor", "--udev", "--subsystem-match", "backlight"]

        stdout: SplitParser {
            onRead: refreshProcess.running = true
        }

        onStarted: {
            console.info(`Brightness: udevadm monitor started`);
            reconnectTimer.stop();
        }

        onExited: exitCode => { // qmllint disable signal-handler-parameters
            console.warn(`Brightness: udevadm monitor exited with code ${exitCode}`);
            reconnectTimer.start();
        }
    }

    Process {
        id: refreshProcess
        running: true
        command: ["brightnessctl", "-c", "backlight", "-m"]

        stdout: SplitParser {
            onRead: line => root.brightness = line.split(",")[3]?.slice(0, -1) ?? 0
        }
    }

    Process {
        id: increaseProcess
        command: ["brightnessctl", "-c", "backlight", "s", "+5%"]
    }

    Process {
        id: decreaseProcess
        command: ["brightnessctl", "-c", "backlight", "s", "5%-"]
    }

    Timer {
        id: reconnectTimer
        interval: 1000
        onTriggered: {
            refreshProcess.running = true;
            monitorProcess.running = true;
        }
    }

    function increaseBrightness(): void {
        increaseProcess.startDetached();
    }

    function decreaseBrightness(): void {
        decreaseProcess.startDetached();
    }
}
