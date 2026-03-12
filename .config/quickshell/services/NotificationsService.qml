pragma Singleton

import Quickshell
import Quickshell.Services.Notifications
import QtQuick

Singleton {
    id: root

    property list<Notification> notifications: server.trackedNotifications.values

    NotificationServer {
        id: server
        imageSupported: true
        actionsSupported: true

        onNotification: notification => {
            notification.tracked = true;
            root.notificationsChanged();
        }
    }

    function clear(): void {
        notifications.forEach(n => Qt.callLater(() => n.dismiss()));
    }
}
