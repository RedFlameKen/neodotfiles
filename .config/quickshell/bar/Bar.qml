// qmllint disable uncreatable-type
pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import QtQuick.Layouts
import "items"
import "../components"
import "../utils"

Scope {
    id: root
    property var defaultMonitor: Quickshell.screens[0].name

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar
            required property var modelData

            color: "transparent"
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30

            Item {
                anchors {
                    fill: parent
                    leftMargin: 5
                    rightMargin: 5
                }

                RowLayout {
                    id: leftItems
                    spacing: 10

                    anchors {
                        left: parent.left
                    }

                    Launcher {}
                    Workspaces {
                        monitorName: bar.modelData.name
                        defaultMonitor: root.defaultMonitor
                    }
                }

                RowLayout {
                    id: centerItems
                    spacing: 10

                    anchors {
                        centerIn: parent
                    }

                    Player {}
                }

                RowLayout {
                    id: rightItems
                    spacing: 10

                    anchors {
                        right: parent.right
                    }

                    Themer {}
                    TemperatureMonitor {}
                    Volume {}
                    Tray {
                        window: bar
                    }
                    Clock {}
                    Battery {}
                }
            }
        }
    }
}
