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
        acceptedButtons: Qt.LeftButton | Qt.MiddleButton | Qt.RightButton

        onClicked: (mouse) => {
            const home = Quickshell.env("HOME")
            const wallpaperScript = home + "/.scripts/awwwWallpaper.sh"
            if (mouse.button == Qt.LeftButton) {
                proc.exec(["bash", wallpaperScript, "next"])
            } else
            if (mouse.button == Qt.RightButton) {
                proc.exec(["bash", wallpaperScript, "prev"])
            } else
            if (mouse.button == Qt.MiddleButton) {
                
                proc.exec(["bash", wallpaperScript, "rand"])
            }
        }

        Process {
            id: proc
            stderr: SplitParser {
                splitMarker: ""
                onRead: (data) => {
                    console.error(`[Themer]: ${data}`)
                }
            }

        }

        Text {
            id: text
            anchors.centerIn: parent

            color: mouseArea.containsMouse ? Theme.green_l : Theme.white_l

            font {
                family: Theme.fontMono
                pixelSize: Theme.fontSizePixels
            }

            text: "󰏘"

        }

    }
}
