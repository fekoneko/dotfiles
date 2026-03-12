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

    readonly property Notification notification: {
        return NotificationsService.notifications[NotificationsService.notifications.length - 1] ?? null;
    }
    readonly property string defaultIcon: {
        return "file://" + Quickshell.shellPath("assets/icons/notification-placeholder.svg");
    }
    readonly property NotificationAction action: notification?.actions[0] ?? null // qmllint disable unresolved-type

    FloatingBarButton {
        icon: root.notification?.image || root.defaultIcon
        iconSize: root.notification?.image ? FloatingBarTheme.notificationIconSize : FloatingBarTheme.iconSize
        text: root.notification?.summary ?? ""
        secondaryText: root.notification?.body ?? ""
        hoverText: root.action ? root.action.text + " | Dismiss" : "Dismiss"
        maxTextWidth: FloatingBarTheme.maxNotificationWidth
        leftPadding: root.notification?.image ? 2.5 : 7
        actionsEnabled: true

        onMainAction: root.action ? root.action.invoke() : root.notification?.dismiss()
        onSecondaryAction: root.notification?.dismiss()
    }

    FloatingBarButton {
        visible: NotificationsService.notifications.length > 1
        text: "+" + (NotificationsService.notifications.length - 1)
    }
}
