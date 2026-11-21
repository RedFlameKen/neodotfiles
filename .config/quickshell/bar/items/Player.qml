import "../../bar"
import "../../utils"
import QtQuick

BarItem {
    id: root
    visible: PlayerControl.player != null
    content: Row {
        id: rootRow

        MouseArea {
            id: mouseArea

            implicitWidth: playerContent.implicitWidth + 10
            implicitHeight: text.implicitHeight

            clip: true

            Row {
                anchors.centerIn: parent

                id: playerContent
                spacing: 5

                Text {
                    id: icon

                    property string icon:
                        PlayerControl.state == "Playing" ? "" :
                        PlayerControl.state == "Paused" ? "" : ""
                                            
                    color:
                        PlayerControl.state == "Playing" ? Theme.green_l :
                        PlayerControl.state == "Paused" ? Theme.red_l : Theme.white_l

                    verticalAlignment: Text.AlignVCenter
                    font {
                        family: Theme.fontMono
                        pixelSize: Theme.fontSizePixels
                    }

                    text: this.icon
                }

                Text {
                    id: text

                    color: Theme.white_l
                    verticalAlignment: Text.AlignVCenter

                    font {
                        family: Theme.fontMono
                        pixelSize: Theme.fontSizePixels
                    }

                    property string icon

                    text: `${PlayerControl.trackTitle.slice(0, 30)}`

                }
            }

        }
    }
}
