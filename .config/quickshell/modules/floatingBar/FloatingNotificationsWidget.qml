import Quickshell
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.themes
import qs.utils

FlexboxLayout {
    id: root
    visible: !!displayedNotification
    alignItems: FlexboxLayout.AlignCenter
    gap: 6

    readonly property Notification notification: {
        return NotificationsService.notifications[NotificationsService.notifications.length - 1] ?? null;
    }
    readonly property NotificationAction action: notification?.actions[0] ?? null // qmllint disable unresolved-type

    // Store displayed fields separately, because Notification struct
    // will be destroyed before fadeOutAnimation finishes
    property var displayedNotification: null // { summary, body, appIcon } | null

    onNotificationChanged: {
        if (notification) {
            if (!displayedNotification || fadeOutAnimation.running) {
                popInAnimation.restart();
                fadeOutAnimation.stop();
            } else
                popAnimation.restart();

            displayedNotification = {
                summary: notification.summary,
                body: notification.body,
                appIcon: notification.appIcon
            };
        } else if (displayedNotification) {
            fadeOutAnimation.restart();
            // displayedNotification will be set to null after fadeOutAnimation finishes
        }
    }

    FloatingBarButton {
        id: button
        iconSize: FloatingBarTheme.notificationIconSize
        text: root.displayedNotification?.summary ?? ""
        secondaryText: root.displayedNotification?.body ?? ""
        hoverText: root.action ? (root.action.text || "Activate") + " | Dismiss" : "Dismiss"
        maxTextWidth: FloatingBarTheme.maxNotificationWidth
        leftPadding: 3.5
        actionsEnabled: !!root.displayedNotification

        icon: {
            const fallback = Icons.assetIconPath("notification-fallback");
            return Quickshell.iconPath(root.displayedNotification?.appIcon, fallback);
        }

        onMainAction: root.action ? root.action.invoke() : root.notification?.dismiss()
        onSecondaryAction: root.notification?.dismiss()

        transform: Scale {
            id: scale
            origin.x: root.width / 2
            origin.y: root.height / 2
        }

        SequentialAnimation {
            id: popInAnimation

            ParallelAnimation {
                NumberAnimation {
                    target: button
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: FloatingBarTheme.animationDurationLong
                }

                NumberAnimation {
                    target: scale
                    property: "xScale"
                    from: 0.9
                    to: 1.035
                    duration: FloatingBarTheme.animationDurationLong
                }

                NumberAnimation {
                    target: scale
                    property: "yScale"
                    from: 0.9
                    to: 1.035
                    duration: FloatingBarTheme.animationDurationLong
                }
            }

            ParallelAnimation {
                NumberAnimation {
                    target: scale
                    property: "xScale"
                    to: 1
                    duration: FloatingBarTheme.animationDurationLong
                }

                NumberAnimation {
                    target: scale
                    property: "yScale"
                    to: 1
                    duration: FloatingBarTheme.animationDurationLong
                }
            }
        }

        SequentialAnimation {
            id: popAnimation

            ParallelAnimation {
                NumberAnimation {
                    target: scale
                    property: "xScale"
                    to: 1.035
                    duration: FloatingBarTheme.animationDurationShort
                }

                NumberAnimation {
                    target: scale
                    property: "yScale"
                    to: 1.035
                    duration: FloatingBarTheme.animationDurationShort
                }
            }

            ParallelAnimation {
                NumberAnimation {
                    target: scale
                    property: "xScale"
                    to: 1
                    duration: FloatingBarTheme.animationDurationShort
                }

                NumberAnimation {
                    target: scale
                    property: "yScale"
                    to: 1
                    duration: FloatingBarTheme.animationDurationShort
                }
            }
        }

        ParallelAnimation {
            id: fadeOutAnimation

            onFinished: {
                if (!root.notification)
                    root.displayedNotification = null;
            }

            NumberAnimation {
                target: button
                property: "opacity"
                to: 0
                duration: FloatingBarTheme.animationDurationLong
            }

            ParallelAnimation {
                NumberAnimation {
                    target: scale
                    property: "xScale"
                    to: 0.9
                    duration: FloatingBarTheme.animationDurationLong
                }

                NumberAnimation {
                    target: scale
                    property: "yScale"
                    to: 0.9
                    duration: FloatingBarTheme.animationDurationLong
                }
            }
        }
    }

    FloatingBarButton {
        visible: NotificationsService.notifications.length > 1
        text: "+" + (NotificationsService.notifications.length - 1)
    }
}
