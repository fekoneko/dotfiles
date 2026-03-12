import QtQuick
import qs.services

Repeater {
    // Use device as a key to avoid needlessly recreating components
    model: NetworkService.connections.map(c => c.device)

    FloatingBarBlock {
        id: barButton
        icon: connection.icon
        showOnChange: true

        required property var modelData
        property var connection: NetworkService.connections.find(c => c.device === modelData)
    }
}
