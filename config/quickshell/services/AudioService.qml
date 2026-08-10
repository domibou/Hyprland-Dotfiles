pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import QtQml


Singleton {
    readonly property var sink: Pipewire.defaultAudioSink

    readonly property bool ready: sink && sink.ready

    readonly property bool muted: ready && sink.audio.muted

    readonly property var volume: ready ? sink.audio.volume : 0.0

    readonly property bool noVolume: volume === 0.0
    readonly property bool isHighVolume: volume > 0.67
    readonly property bool isMediumVolume: volume > 0.34  && !isHighVolume
    readonly property bool isLowVolume: volume > 0.0 && !isMediumVolume && !isHighVolume

    property bool volumePanelVisible: false

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

    function _showVolumePanel() {
        volumePanelVisible = true
        volumePanelVisibleTimer.restart()
    }

    onVolumeChanged: {
        if (!muted) _showVolumePanel()
    }

    onMutedChanged: {
        _showVolumePanel()
    }

    Timer {
        id: volumePanelVisibleTimer
        interval: 1200
        repeat: false

        onTriggered: volumePanelVisible = false
    }

    PwObjectTracker {
        objects: [sink]
    }
}