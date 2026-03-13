import QtQuick
import qs.services

Repeater {
    // Use device as a key to avoid needlessly recreating components
    model: NetworkService.connections.map(c => c.device)

    FloatingBarButton {
        id: barButton
        icon: connection.icon
        showOnChange: true

        required property string modelData
        property var connection: NetworkService.connections.find(c => c.device === modelData)
    }
}
