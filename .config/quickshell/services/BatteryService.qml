pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import QtQuick
import qs.utils

Singleton {
    id: root

    readonly property bool onBattery: UPower.onBattery
    readonly property real percentage: UPower.displayDevice.percentage * 100
    readonly property string formattedPercentage: Math.round(percentage) + "%"

    readonly property string icon: {
        const roundedPercentage = Math.round(percentage / 10) * 10;
        const icon = `battery-${onBattery ? "" : "charging-"}${roundedPercentage}`;
        return Icons.assetIconUrl(icon);
    }

    property bool lowNotified: false
    property bool criticalNotified: false

    onPercentageChanged: percentageHooks()
    onOnBatteryChanged: percentageHooks()

    function percentageHooks() {
        if (!percentage)
            return;

        if (onBattery) {
            if (percentage <= 5 && !criticalNotified) {
                criticalNotificationProcess.show();
                criticalNotified = true;
            } else if (percentage <= 15 && !lowNotified) {
                lowNotificationProcess.show();
                lowNotified = true;
            }

            if (percentage <= 3)
                Quickshell.execDetached(["systemctl", "suspend"]);
        } else {
            lowNotificationProcess.hide();
            lowNotified = false;

            criticalNotificationProcess.hide();
            criticalNotified = false;
        }
    }

    Process {
        id: lowNotificationProcess

        function show() {
            const icon = Icons.assetIconPath("battery-10");
            const summary = "Battery is low";
            const body = "Battery level: " + root.formattedPercentage;
            command = ["notify-send", "--wait", "--app-icon", icon, summary, body];
            running = true;
        }

        function hide() {
            signal(2); // SIGINT
        }
    }

    Process {
        id: criticalNotificationProcess

        function show() {
            const icon = Icons.assetIconPath("battery-0");
            const summary = "Battery is critically low";
            const body = "Battery level: " + root.formattedPercentage;
            command = ["notify-send", "--wait", "--app-icon", icon, summary, body];
            running = true;
        }

        function hide() {
            signal(2); // SIGINT
        }
    }
}
