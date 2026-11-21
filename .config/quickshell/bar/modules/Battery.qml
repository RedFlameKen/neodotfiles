import QtQuick
import "../"
import "../../system"
import "../../utils"

BarItem {
    id: root
    visible: Power.usingBattery

    property string textColor:  Power.state == 1 ? Theme.yellow_l : 
                                Power.state == 2 ?
                                    Power.percentage <= 20 ? Theme.orange_l :
                                    Power.percentage <= 10 ? Theme.red_l :
                                    Theme.white_l : Theme.white_l

    property double percentage: Power.percentage
    property string percentageText: `${Math.round(percentage * 100)}%`
    property string icon:   Power.state == 1 ?
                                percentage < 0.2 ? "󰢟" :
                                percentage < 0.4 ? "󰂆" :
                                percentage < 0.6 ? "󰁾" :
                                percentage < 0.8 ? "󰂊" :
                                percentage >= 1  ? "󰂅" : "" :

                                // not charging
                                percentage < 0.2 ? "󰂎" :
                                percentage < 0.4 ? "󰁻" :
                                percentage < 0.6 ? "󰁾" :
                                percentage < 0.8 ? "󰂁" :
                                percentage >= 1  ? "󰂁" :
                                                   "󰁹";


    content: Text {
        text: `${root.icon} ${root.percentageText}`
        color: root.textColor

        font {
            family: Theme.fontMono
            pixelSize: Theme.fontSizePixels
        }

    }

}
