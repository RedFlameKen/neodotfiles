pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Singleton {
    id: root

    property bool ready: Pipewire ? Pipewire.ready : false
    property PwNode source: Pipewire ? Pipewire.defaultAudioSource : null
    property real volumeMic: source && source.audio ? source.audio.volume * 100 : 0
    property bool mutedMic: source && source.audio ? source.audio.muted : true

    property PwNode sink: Pipewire ? Pipewire.defaultAudioSink : null
    property real volume: sink && sink.audio ? sink.audio.volume * 100 : 0
    property bool muted: sink && sink.audio ? sink.audio.muted : true

    PwObjectTracker {
        objects: [root.sink, root.source]
    }

    property var muteMic: function() {
        Pipewire.defaultAudioSource.audio.muted = !mutedMic
    }

    property var mute: function() {
        Pipewire.defaultAudioSink.audio.muted = !muted
    }

    /**
     * Update the default source's volume. Use a positive (+) number to
     * increase, and use a negative (-) number to reduce
     */
    property var updateSourceVolume: function(increment: real){
        Pipewire.defaultAudioSource.audio.volume += increment
    }

    /**
     * Update the default sink's volume. Use a positive (+) number to
     * increase, and use a negative (-) number to reduce
     */
    property var updateSinkVolume: function(increment: real){
        Pipewire.defaultAudioSink.audio.volume += increment
    }

}
