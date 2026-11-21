pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    property string time: systemClock ? systemClock.date : null

    SystemClock {
        id: systemClock
        precision: SystemClock.Seconds
    }

}
