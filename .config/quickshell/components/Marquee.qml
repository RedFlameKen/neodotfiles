import QtQuick

Flickable {
    id: flick
    property alias font: marqueeText.font
    property alias textColor: marqueeText.color
    property alias text: marqueeText.text
    property alias scrolling: scrollAnimation.running

    // How fast the marquee passes by a character
    property real duration: 500
    clip: true
    contentWidth: marqueeText.width + 30
    contentHeight: marqueeText.height

    Text {
        id: marqueeText

        Text {
            id: second
            font: flick.font
            color: flick.textColor
            x: flick.contentWidth
            text: marqueeText.text
        }
    }

    SequentialAnimation {
        id: scrollAnimation
        running: true
        loops: SequentialAnimation.Infinite
        NumberAnimation {
            target: flick
            property: "contentX"
            duration: flick.duration * marqueeText.text.length
            from: 0
            to: flick.contentWidth
        }
    }
}
