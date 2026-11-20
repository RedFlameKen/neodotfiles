import QtQuick
import "../"
import "../../utils"

BarItem {
    content: Rectangle {
        implicitWidth: text.implicitWidth

        Text {
            id: text

            color: Theme.white_l

            text: `󰥔 ${Qt.formatDateTime(Time.time, "hh:mm")}`

            font {
                family: Theme.fontMono
                pixelSize: Theme.fontSizePixels
            }
        }
    }
}
