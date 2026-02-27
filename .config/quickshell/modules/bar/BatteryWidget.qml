import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import QtQuick

BarButton {
    icon: {
        const percentage = Math.round(UPower.displayDevice.percentage * 10) * 10;
        const iconPath = `assets/icons/battery-${UPower.onBattery ? "" : "charging-"}${percentage}.svg`;
        return "file://" + Quickshell.shellPath(iconPath);
    }
    text: Math.round(UPower.displayDevice.percentage * 100) + "%"
    onMainAction: process.startDetached()

    Process {
        id: process
        command: ["tlpui"]
    }
}
