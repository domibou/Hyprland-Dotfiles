import QtQuick
import QtQuick.Layouts

import "../"
import "../../.."
import "../../../services"
import "../../components"


Widget {
    clickable: true

    content: RowLayout {
        id: layout

        spacing: Config.iconSpacing

        property int volumePercent: Math.round(AudioService.volume * 100)

        Text {
            text: {
                if (!AudioService.ready) return String.fromCodePoint(0xF0581)
                if (AudioService.muted) return "󰸈"

                if (AudioService.noVolume) return String.fromCodePoint(0xF0581)
                if (AudioService.isLowVolume) return String.fromCodePoint(0xF057F)
                if (AudioService.isMediumVolume) return String.fromCodePoint(0xF0580)

                return String.fromCodePoint(0xF057E)
            }

            font {
                family: Config.textFontFamily
                pixelSize: Config.iconSize
            }

            color: Colors.audio
        }

        Text {
            text: {
                if (!AudioService.ready) return "-"
                if (AudioService.muted) return "Muted"
                return layout.volumePercent + "%"
            }

            font {
                family: Config.textFontFamily
                pixelSize: Config.textSize
                weight: Config.textWeight
            }

            color: Colors.audio
        }
    }

    TapHandler {
        onTapped: AudioService.toggleMute()
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton
        hoverEnabled: false

        onWheel: (event) => {
            if (event.angleDelta.y > 0) AudioService.volumeUp()
            else if (event.angleDelta.y < 0) AudioService.volumeDown()
        }
    }
}