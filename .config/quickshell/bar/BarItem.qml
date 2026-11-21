import QtQuick
import QtQuick.Layouts
import "../utils/"

Rectangle {
    id: root
    Layout.preferredWidth: content.implicitWidth + 12
    Layout.preferredHeight: 24
    Layout.topMargin: 3
    Layout.bottomMargin: 3
    radius: Theme.cornerRounding

    property Item content

    color: Theme.black

    Behavior on color {
        ColorAnimation {
            duration: 100
        }
    }

    Item {
        id: contentWrapper
        Layout.alignment: Qt.AlignCenter
        implicitWidth: root.content.implicitWidth
        implicitHeight: root.content.implicitHeight
        anchors {
            fill: parent
            centerIn: parent
            topMargin: 2
            bottomMargin: 2
            leftMargin: 6
            rightMargin: 6
            verticalCenter: parent.verticalCenter 
        }
        children: root.content
    }

}
