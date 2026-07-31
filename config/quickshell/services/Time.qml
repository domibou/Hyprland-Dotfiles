pragma Singleton

import Quickshell

Singleton {
    readonly property string time: {
        Qt.formatDateTime(clock.date, "hh:mm")
    }

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}