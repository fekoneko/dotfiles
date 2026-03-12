import Quickshell
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.themes

FlexboxLayout {
    id: root
    visible: NotificationsService.notifications.length > 0
    alignItems: FlexboxLayout.AlignCenter
    gap: 6

    readonly property Notification lastNotification: {
        return NotificationsService.notifications[NotificationsService.notifications.length - 1] ?? null;
    }
    readonly property string defaultNotificationIcon: {
        return "file://" + Quickshell.shellPath("assets/icons/notification-placeholder.svg");
    }

    FloatingBarBlock {
        icon: root.lastNotification?.image || root.defaultNotificationIcon
        iconSize: root.lastNotification?.image ? FloatingBarTheme.notificationIconSize : FloatingBarTheme.iconSize
        text: root.lastNotification?.summary ?? ""
        secondaryText: root.lastNotification?.body ?? ""
        maxTextWidth: FloatingBarTheme.maxNotificationWidth
        paddingLeft: root.lastNotification?.image ? 2.5 : 7
    }

    FloatingBarBlock {
        visible: NotificationsService.notifications.length > 1
        text: "+" + (NotificationsService.notifications.length - 1)
    }
}
