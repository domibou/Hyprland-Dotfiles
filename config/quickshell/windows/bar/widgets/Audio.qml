import QtQuick
import QtQuick.Layouts

import "../"
import "../../.."
import "../../../services"
import "components"

Pill {
    id: pill

    content:
        RowLayout {
            id: layout

            anchors.centerIn: parent
            spacing: Config.iconSpacing

            property int volumePercent: Math.round(Audio.volume * 100)

            Text {
                color: Colors.text

                text: {
                    if (!Audio.ready) return String.fromCodePoint(0xF0581)
                    if (Audio.muted) return "󰸈"

                    if (layout.volumePercent === 0) return String.fromCodePoint(0xF0581)
                    if (layout.volumePercent < 34) return String.fromCodePoint(0xF057F)
                    if (layout.volumePercent < 67) return String.fromCodePoint(0xF0580)

                    return String.fromCodePoint(0xF057E)
                }

                font {
                    family: Config.textFontFamily
                    pixelSize: Config.iconSize
                }
            }

            Text {
                color: Colors.text

                text: {
                    if (!Audio.ready) return "-"
                    if (Audio.muted) return "Muted"
                    return layout.volumePercent + "%"
                }

                font {
                    family: Config.textFontFamily
                    pixelSize: Config.textSize
                    weight: Config.textWeight
                }
            }
        }

    TapHandler {
        onTapped: Audio.toggleMute()
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton
        hoverEnabled: false

        onWheel: (event) => {
            if (event.angleDelta.y > 0) Audio.volumeUp()
            else if (event.angleDelta.y < 0) Audio.volumeDown()
        }
    }
}