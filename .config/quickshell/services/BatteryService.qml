pragma Singleton

import Quickshell
import Quickshell.Services.UPower
import QtQuick
import qs.utils

Singleton {
    readonly property bool onBattery: UPower.onBattery
    readonly property real percentage: UPower.displayDevice.percentage * 100
    readonly property string formattedPercentage: Math.round(percentage) + "%"

    readonly property string icon: {
        const roundedPercentage = Math.round(percentage / 10) * 10;
        const icon = `battery-${onBattery ? "" : "charging-"}${roundedPercentage}`;
        return Icons.assetIconUrl(icon);
    }
}
