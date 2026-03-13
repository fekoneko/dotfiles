// qmllint disable unresolved-type unqualified
// All Bluetooth properties cannot be resolved for some reason

pragma Singleton

import Quickshell
import Quickshell.Bluetooth
import QtQuick
import qs.utils

Singleton {
    id: root

    readonly property list<BluetoothDevice> devices: Bluetooth.defaultAdapter?.devices.values ?? []
    readonly property bool connected: !!devices.filter(device => device.connected).length

    readonly property string icon: {
        const adapter = Bluetooth.defaultAdapter;
        if (!adapter?.enabled)
            return Icons.assetIconUrl("bluetooth-disabled");
        else if (connected)
            return Icons.assetIconUrl("bluetooth-connected");
        else
            return Icons.assetIconUrl("bluetooth-disconnected");
    }

    function toggle(): void {
        const adapter = Bluetooth.defaultAdapter;
        if (adapter)
            adapter.enabled = !adapter.enabled;
    }
}
