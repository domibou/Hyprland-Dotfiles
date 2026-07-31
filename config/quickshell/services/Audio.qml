pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire

Singleton {
    readonly property var sink: Pipewire.defaultAudioSink

    readonly property bool ready: sink && sink.ready
    readonly property bool muted: ready && sink.audio.muted

    property var volume: ready ? sink.audio.volume : 0.0

    function volumeUp(percent = 2) {
        if (!ready) return

        sink.audio.volume = Math.min(sink.audio.volume + percent/100, 1.0)
    }

    function volumeDown(percent = 2) {
        if (!ready) return
       
       sink.audio.volume = Math.max(sink.audio.volume - percent/100, 0.0)
    }

    function toggleMute() {
        if (!ready) return
        
        sink.audio.muted = !sink.audio.muted        
    }

    PwObjectTracker {
        objects: [sink]
    }
}