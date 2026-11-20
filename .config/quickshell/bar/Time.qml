pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    property string time: systemClock.date

    SystemClock {
        id: systemClock
        precision: SystemClock.Seconds
    }

}
