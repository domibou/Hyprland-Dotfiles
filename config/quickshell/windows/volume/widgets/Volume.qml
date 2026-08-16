import QtQuick
import QtQuick.Layouts

import "../"
import "../../.."
import "../../../services"
import "../../components"


Widget {
    id: widget

    implicitHeight: layout.implicitHeight + 5

    content: RowLayout {
        id: layout
        
        spacing: Config.iconSpacing

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
                pixelSize: Config.iconSize * 0.72
            }

            color: Colors.volume
        }

        Rectangle {
            implicitWidth: Config.volumeBarWidth
            implicitHeight: Config.volumeBarHeight

            radius: Config.volumeProgressBarRadius

            color: Colors.black

            Rectangle {
                y: parent.mapToItem(parent, 0, 0).y

                implicitWidth: AudioService.volume * parent.implicitWidth
                implicitHeight: parent.implicitHeight

                radius: Config.volumeProgressBarRadius

                color: Colors.volume

                Behavior on implicitWidth {
                    NumberAnimation {
                        duration: Config.animationDuration
                        easing.type: Easing.OutCubic
                    }
                }
            }
        }
    }
}
