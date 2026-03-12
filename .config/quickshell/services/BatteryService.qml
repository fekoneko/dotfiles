pragma Singleton

import Quickshell
import Quickshell.Services.UPower
import QtQuick

Singleton {
    readonly property bool onBattery: UPower.onBattery
    readonly property real percentage: UPower.displayDevice.percentage * 100
    readonly property string formattedPercentage: Math.round(percentage) + "%"

    readonly property string icon: {
        const roundedPercentage = Math.round(percentage / 10) * 10;
        const iconPath = `assets/icons/battery-${onBattery ? "" : "charging-"}${roundedPercentage}.svg`;
        return Quickshell.iconPath(Quickshell.shellPath(iconPath));
    }
}
