// qmllint disable missing-property
pragma Singleton

import Quickshell
import Quickshell.Services.UPower
import QtQuick

Singleton {
    id: root

    property bool onBattery: battery != null ? UPower.onBattery : false
    property string percentage: battery != null ? battery.percentage : 0
    property string state: battery != null ? battery.state : 6

    property UPowerDevice battery: UPower.devices.values[0] != null ? 
                                   UPower.devices.values[0] : null

}
