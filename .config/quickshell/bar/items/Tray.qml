pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts
import "../"

BarItem {
    id: root
    property PanelWindow window

    content: RowLayout {
        spacing: 2
        Repeater {
            model: SystemTray.items

            MouseArea {
                id: mouseArea
                required property SystemTrayItem modelData
                implicitWidth: icon.implicitWidth
                implicitHeight: icon.implicitHeight
                acceptedButtons: Qt.LeftButton | Qt.MiddleButton | Qt.RightButton
                cursorShape: Qt.PointingHandCursor

                onClicked: mouse => {
                    function left() {
                        if(modelData.hasMenu){
                            if (root.window != null) {
                                const position = window.itemPosition(icon)

                                modelData.display(root.window, 
                                                  position.x + mouse.x,
                                                  position.y + mouse.y)
                            }
                        } else
                            modelData.activate()
                    }

                    function middle() {
                        modelData.activate()
                    }

                    function right() {
                        modelData.secondaryActivate()
                    }

                    if(mouse.button == Qt.LeftButton) {
                        left()
                    } else
                    if(mouse.button == Qt.MiddleButton) {
                        middle()
                    } else
                    if(mouse.button == Qt.RightButton) {
                        right()
                    }

                }

                IconImage {
                    id: icon
                    source: mouseArea.modelData.icon
                    implicitWidth: 25
                    implicitHeight: 20
                }
            }
        }
    }
}
