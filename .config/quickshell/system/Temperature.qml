pragma Singleton
import Quickshell
import Quickshell.Io
import QtQuick

Singleton {

    id: root
    property int temp: parseInt(tempFile.text()) / 1000

    property bool loaded: tempFile.loaded

    FileView {
        id: tempFile
        path: "/sys/class/thermal/thermal_zone0/temp"
        watchChanges: true
        onLoadFailed: {
            root.loaded = false
        }
    }

    Timer {
        interval: 10000 // 10 seconds

        running: true

        repeat: true

        onTriggered: tempFile.reload()
    }


}
