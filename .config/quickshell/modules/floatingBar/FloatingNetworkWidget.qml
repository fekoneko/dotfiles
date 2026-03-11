import QtQuick
import qs.services

Repeater {
    // Use index as a key to avoid needlessly recreating components
    model: NetworkService.connections.map((_, index) => index)

    FloatingBarButton {
        id: barButton
        icon: connection.icon
        showOnChange: true

        required property var modelData
        property var connection: NetworkService.connections[modelData]
    }
}
