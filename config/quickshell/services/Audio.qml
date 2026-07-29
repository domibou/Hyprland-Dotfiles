pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Io

Singleton {
    id: audio

    readonly property var sink: Pipewire.defaultAudioSink

    readonly property bool ready: sink && sink.ready
    readonly property bool muted: ready && sink.audio.muted
    readonly property int volume: ready ? Math.round(sink.audio.volume * 100) : 0

    function increase(step = 2) {
        volUp.command = [
            "wpctl",
            "set-volume",
            "@DEFAULT_AUDIO_SINK@",
            step + "%+"
        ]
        volUp.running = true
    }

    function decrease(step = 2) {
        volDown.command = [
            "wpctl",
            "set-volume",
            "@DEFAULT_AUDIO_SINK@",
            step + "%-"
        ]
        volDown.running = true
    }

    function toggleMute() {
        mute.running = true
    }

    PwObjectTracker {
        objects: [audio.sink]
    }

    Process {
        id: volUp
    }

    Process {
        id: volDown
    }

    Process {
        id: mute
        command: ["wpctl", "set-mute", "@DEFAULT_AUDIO_SINK@", "toggle"]
    }
}