pragma Singleton

import Quickshell

Singleton {
    readonly property string date: {
        Qt.formatDateTime(clock.date, "MMM d")
    }

    readonly property string time: {
        Qt.formatDateTime(clock.date, "hh:mm")
    }

    property bool displayDate: false

    function toggleMode() {
        displayDate = !displayDate
    }

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}