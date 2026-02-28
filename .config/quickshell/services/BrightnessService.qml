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
        running: true
        command: ["udevadm", "monitor", "--udev", "--subsystem-match", "backlight"]

        stdout: SplitParser {
            onRead: refreshProcess.running = true
        }

        onExited: exitCode => { // qmllint disable signal-handler-parameters
            console.error(`Brightness: udevadm exited with code ${exitCode}`);
        }
    }

    Process {
        id: refreshProcess
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

    function increaseBrightness(): void {
        increaseProcess.startDetached();
    }

    function decreaseBrightness(): void {
        decreaseProcess.startDetached();
    }
}
