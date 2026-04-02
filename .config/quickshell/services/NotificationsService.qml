pragma Singleton

import Quickshell
import Quickshell.Services.Notifications
import QtQuick
import qs.utils

Singleton {
    id: root

    property list<Notification> notifications: server.trackedNotifications.values
    property bool dnd: false

    readonly property string dndIcon: {
        if (dnd)
            return Icons.assetIconUrl("dnd-enabled");
        else
            return Icons.assetIconUrl("dnd-disabled");
    }

    NotificationServer {
        id: server
        actionsSupported: true

        onNotification: notification => {
            notification.tracked = true;
            root.notificationsChanged();
        }
    }

    function clear(): void {
        notifications.forEach(n => Qt.callLater(() => n.dismiss()));
    }

    function toggleDnd(): void {
        dnd = !dnd;
    }
}
