import QtQuick
import qs.services

BarButton {
    icon: NotificationsService.dndIcon
    onMainAction: NotificationsService.toggleDnd()
}
