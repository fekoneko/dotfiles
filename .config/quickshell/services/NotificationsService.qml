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

        onNotification: notification => {
            notification.tracked = true;
            root.notificationsChanged();
        }
    }
}
