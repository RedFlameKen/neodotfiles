import QtQuick
import "../../bar"
import "../../utils"

BarItem {
    visible: Audio.ready

    content: Row {
        spacing: 10

        MouseArea {
            id: sourceMouseArea
            implicitWidth: sourceText.implicitWidth
            implicitHeight: sourceText.implicitHeight
            cursorShape: Qt.PointingHandCursor
            acceptedButtons: Qt.LeftButton | Qt.RightButton

            onClicked: {
                Audio.muteMic()
            }

            onWheel: (wheel) => {
                Audio.updateSourceVolume(wheel.angleDelta.y / 12000.0)
            }

            Text {
                id: sourceText
                color: Audio.mutedMic ? Theme.orange_l : Theme.white_l
                property string icon: Audio.mutedMic ? "" : ""

                font {
                    family: Theme.fontMono
                    pixelSize: Theme.fontSizePixels
                }

                text: `${icon} ${Math.round(Audio.volumeMic)}%`
            }
        }


        MouseArea {
            id: sinkMouseArea
            implicitWidth: sinkText.implicitWidth
            implicitHeight: sinkText.implicitHeight
            cursorShape: Qt.PointingHandCursor

            onClicked: {
                Audio.mute()
            }

            onWheel: (wheel) => {
                Audio.updateSinkVolume(wheel.angleDelta.y / 12000.0)
            }

            Text {
                id: sinkText
                color: Audio.muted ? Theme.orange_l : Theme.white_l 
                property string icon: Audio.muted ? "󰝟" :
                                        Audio.volume <= 0  ? "󰝟" :
                                        Audio.volume <= 30 ? "󰕿" :
                                        Audio.volume <= 70 ? "󰖀" : "󰕾";

                font {
                    family: Theme.fontMono
                    pixelSize: Theme.fontSizePixels
                }

                text: `${icon} ${Math.round(Audio.volume)}%`
            }
        }
    }
}

