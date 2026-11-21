pragma Singleton
import Quickshell
import Quickshell.Services.Mpris

Singleton {

    readonly property var players: Mpris.players ? Mpris.players : null
    readonly property MprisPlayer player: Mpris.players ? Mpris.players.values[0] 
                                          ? Mpris.players.values[0] : null : null

    readonly property string trackTitle: player ? player.trackTitle : ""
    readonly property string trackArtist: player ? player.trackArtist : ""

    readonly property string state: player ? MprisPlaybackState.toString(player.playbackState) : "Stopped"

    property var setState: (state) => {
        if (!player){
            return
        }

        if (state == "Playing" && player.canPlay)
            player.playbackState = MprisPlaybackState.Playing
        else
        if (state == "Paused" && player.canPause)
            player.playbackState = MprisPlaybackState.Paused
        else
        if (state == "Stopped" && player.canControl)
            player.playbackState = MprisPlaybackState.Stopped
    }

    property var toggle: () => {
        player.togglePlaying()
    }

    property var next: () => {
        player.next()
    }

    property var previous: () => {
        player.previous()
    }


}
