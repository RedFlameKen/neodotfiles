// qmllint disable uncreatable-type
pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import QtQuick.Layouts
import "modules"

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
                    spacing: 5

                    anchors {
                        left: parent.left
                    }

                    Launcher {}
                    Themer {}
                    Workspaces {
                        monitorName: bar.modelData.name
                        defaultMonitor: root.defaultMonitor
                    }
                    Player {}
                }

                RowLayout {
                    id: centerItems
                    spacing: 5

                    anchors {
                        centerIn: parent
                    }
                }

                RowLayout {
                    id: rightItems
                    spacing: 5

                    anchors {
                        right: parent.right
                    }

                    TemperatureMonitor {}
                    Volume {}
                    Calendar {}
                    Clock {}
                    Tray { window: bar }
                    Battery {}
                }
            }
        }
    }
}
