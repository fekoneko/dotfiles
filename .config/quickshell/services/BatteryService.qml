pragma Singleton

import Quickshell
import Quickshell.Services.UPower
import QtQuick

Singleton {
    readonly property string percentage: Math.round(UPower.displayDevice.percentage * 100) + "%"

    readonly property string icon: {
        const percentage = Math.round(UPower.displayDevice.percentage * 10) * 10;
        const iconPath = `assets/icons/battery-${UPower.onBattery ? "" : "charging-"}${percentage}.svg`;
        return "file://" + Quickshell.shellPath(iconPath);
    }
}
