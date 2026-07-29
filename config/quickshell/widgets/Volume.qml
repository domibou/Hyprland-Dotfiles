import QtQuick
import QtQuick.Layouts

import "../services"

Rectangle {
    width: 100
    height: 40
    radius: 22

    RowLayout {
        anchors.centerIn: parent

        Text {
            text: {
                if (!Audio.ready) return String.fromCodePoint(0xF0581)
                if (Audio.muted) return "󰸈"

                if (Audio.volume === 0) return String.fromCodePoint(0xF0581)
                if (Audio.volume < 34) return String.fromCodePoint(0xF057F)
                if (Audio.volume < 67) return String.fromCodePoint(0xF0580)

                return String.fromCodePoint(0xF057E)
            }
            
            font {
                family: "JetBrainsMono Nerd Font"
                pixelSize: 22
            }
        }

        Text {
            text: {
                if (!Audio.ready)
                    return "-"

                if (Audio.muted)
                    return "Muted"

                return Audio.volume + "%"
            }

            font {
                family: "JetBrainsMono Nerd Font"
                pixelSize: 16
                weight: 500
            }
        }
    }

    MouseArea {
        anchors.fill: parent

        onWheel: function(event) {
            if (event.angleDelta.y > 0) Audio.increase(2)
            if (event.angleDelta.y < 0) Audio.decrease(2)
        }

        onClicked: Audio.toggleMute()
    }
}