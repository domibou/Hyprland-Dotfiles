import Quickshell
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts
import Quickshell.Io


Rectangle {
    width: 100
    height: 40
    radius: 22

    RowLayout {
        id: root
        anchors.centerIn: parent

        property var sink: Pipewire.defaultAudioSink

        readonly property bool ready: sink && sink.ready
        readonly property bool muted: ready && sink.audio.muted 
        readonly property int vol: ready ? Math.round(sink.audio.volume * 100) : 0

        readonly property string icon: {
            if (!ready) return String.formatCodePoint(0xF0581)
            if (muted) return "󰸈"

            if (vol === 0) return String.fromCodePoint(0xF0581)
            if (vol < 34) return String.fromCodePoint(0xF057F)
            if (vol < 67) return String.fromCodePoint(0xF0580)

            return String.fromCodePoint(0xF057E)
        }

        Text {
            text: root.icon

            font {
                family: "JetBrainsMono Nerd Font"
                pixelSize: 22
            }
        }

        Text {
            text: {
                if (!root.ready) return "-"
                if (root.muted) return "Muted"

                return root.vol + "%"
            }

            font {
                family: "JetBrainsMono Nerd Font"
                pixelSize: 16
                weight: 500
            }
        }

        PwObjectTracker {
            objects: [root.sink]
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onWheel: function(event) {
            if (event.angleDelta.y > 0) {
                volUp.running = true
            }
            if (event.angleDelta.y < 0) {
                volDown.running = true
            }
        }
    }

    Process {
        id: volUp
        command: ["wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "2%+"]
    }

    Process {
        id: volDown
        command: ["wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "2%-"]
    }
}