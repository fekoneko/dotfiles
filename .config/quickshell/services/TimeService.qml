pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property date time: clock.date
    readonly property string formattedTime: Qt.formatDateTime(time, "hh:mm")

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
