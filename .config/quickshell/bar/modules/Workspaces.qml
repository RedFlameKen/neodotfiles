pragma ComponentBehavior: Bound
import "../../bar"
import "../../utils"
import "../../wm"
import QtQuick
import QtQuick.Layouts

BarItem {
    id: root
    visible: root.workspaces.length > 0
    required property string monitorName
    required property string defaultMonitor
    property var workspaces: HyprlandWorkspaces.getWorkspaces(root.monitorName, root.defaultMonitor, 5)

    property var icons: {
        "1": "󰈹",
        "2": "",
        "3": "",
        "4": "",
        "5": "",
        "6": "",
        "7": "",
        "default": "󱁤",
    }

    content: Item {
        implicitWidth: rowLayout.implicitWidth + 10
        implicitHeight: rowLayout.implicitHeight
        RowLayout {
            id: rowLayout
            spacing: 10

            anchors.centerIn: parent

            Repeater {
                model: root.workspaces

                MouseArea {
                    id: mouseArea
                    required property var modelData
                    implicitWidth: text.implicitWidth
                    implicitHeight: text.implicitHeight
                    hoverEnabled: true

                    cursorShape: Qt.PointingHandCursor
                    acceptedButtons: Qt.LeftButton

                    onClicked: {
                        HyprlandWorkspaces.focusWorkspace(modelData.id)
                    }

                    onWheel: (wheel) => {
                        if (wheel.angleDelta.y > 0){
                            HyprlandWorkspaces.focusWorkspaceNext()
                        } else if (wheel.angleDelta.y < 0) {
                            HyprlandWorkspaces.focusWorkspacePrev()
                        }

                    }

                    Text {
                        id: text
                        property var modelData: mouseArea.modelData

                        font {
                            family: Theme.fontMono
                            pixelSize: Theme.fontSizePixels
                        }

                        color: mouseArea.containsMouse ? Theme.white : 
                        HyprlandWorkspaces.currentWorkspace ?
                        HyprlandWorkspaces.currentWorkspace.id == modelData.id
                        ? Theme.green_l :
                        modelData.urgent ? Theme.red_l : 
                        modelData.used ? Theme.blue_l : Theme.white_l
                        : Theme.white_l

                        text: `${root.icons[modelData.id] ?? root.icons["default"]}`
                    }
                }


            }

        }
    }
}
