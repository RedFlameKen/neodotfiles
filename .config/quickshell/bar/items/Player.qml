import "../../bar"
import "../../utils"
import "../../components"
import QtQuick
import QtQuick.Layouts

BarItem {
    id: root
    visible: PlayerControl.player != null && PlayerControl.state != "Stopped"
    property int maxCharCount: 50
    content: Row {
        id: rootRow

        MouseArea {
            id: mouseArea

            implicitWidth: playerContent.implicitWidth + 10
            implicitHeight: playerContent.implicitHeight

            clip: true

            RowLayout {
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

                Marquee {
                    id: marqueeText
                    textColor: Theme.white_l
                    implicitWidth: Math.min(300, marqueeText.contentWidth - 30)
                    implicitHeight: marqueeText.contentHeight
                    scrolling: root.visible && marqueeText.text.length > root.maxCharCount

                    font {
                        family: Theme.fontMono
                        pixelSize: Theme.fontSizePixels
                    }

                    text: `${PlayerControl.trackTitle}`
                }
            }

        }
    }
}

