import "../../bar"
import "../../utils"
import "../../system"
import QtQuick

BarItem {
    visible: Temperature.loaded

    content: Text {

        property string icon:   Temperature.temp < 40 ? "" :
                                Temperature.temp < 60 ? "" :
                                Temperature.temp < 85 ? "" : ""

        color:  Temperature.temp < 55 ? Theme.blue_l :
                Temperature.temp < 85 ? Theme.orange_l : Theme.red_l

        font {
            family: Theme.fontMono
            pixelSize: Theme.fontSizePixels
        }

        text: `${icon} ${Temperature.temp}°C`
    }

}
