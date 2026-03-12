// qmllint disable unresolved-type unqualified
// All Bluetooth properties cannot be resolved for some reason

pragma Singleton

import Quickshell
import Quickshell.Bluetooth
import QtQuick

Singleton {
    id: root

    readonly property list<BluetoothDevice> devices: Bluetooth.defaultAdapter?.devices.values ?? []
    readonly property bool connected: !!devices.filter(device => device.connected).length

    readonly property string icon: {
        const adapter = Bluetooth.defaultAdapter;
        let icon;
        if (!adapter?.enabled)
            icon = "assets/icons/bluetooth-disabled.svg";
        else if (connected)
            icon = "assets/icons/bluetooth-connected.svg";
        else
            icon = "assets/icons/bluetooth-disconnected.svg";

        return Quickshell.iconPath(Quickshell.shellPath(icon));
    }

    function toggle(): void {
        const adapter = Bluetooth.defaultAdapter;
        if (adapter)
            adapter.enabled = !adapter.enabled;
    }
}
