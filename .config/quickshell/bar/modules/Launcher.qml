import "../../bar"
import "../../utils"
import Quickshell
import Quickshell.Io
import QtQuick

BarItem {
    content: MouseArea {
        id: mouseArea
        implicitWidth: text.implicitWidth + 6
        implicitHeight: text.implicitHeight
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        acceptedButtons: Qt.LeftButton

        onClicked: (mouse) => {
            const home = Quickshell.env("HOME")
            const launcherScript = home + "/.local/bin/rofi-runner"
            proc.exec([launcherScript])
        }

        Process {
            id: proc
            stderr: SplitParser {
                splitMarker: ""
                onRead: (data) => {
                    console.error(`[Launcher]: ${data}`)
                }
            }

        }

        Text {
            id: text
            anchors.centerIn: parent

            color: mouseArea.containsMouse ? Theme.green_l : Theme.blue_l

            font {
                family: Theme.fontMono
                pixelSize: Theme.fontSizePixels
            }

            text: "󰣇"

        }

    }
}
