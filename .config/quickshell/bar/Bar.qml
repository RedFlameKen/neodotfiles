// qmllint disable uncreatable-type
import Quickshell
import QtQuick
import QtQuick.Layouts
import "items"

Scope {
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

                    Clock {}
                }

                RowLayout {
                    id: centerItems
                    spacing: 10

                    anchors {
                        centerIn: parent
                    }

                    Clock {}
                }

                RowLayout {
                    id: rightItems
                    spacing: 10

                    anchors {
                        right: parent.right
                    }

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
