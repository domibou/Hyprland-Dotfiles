import QtQuick
import QtQuick.Layouts

import "../"
import "../../.."
import "../../../services"
import "../../components"


Widget {
    id: widget

    content: RowLayout {
        spacing: Config.iconSpacing

        Text {
            text: {
                if (!Audio.ready) return String.fromCodePoint(0xF0581)
                if (Audio.muted) return "󰸈"

                if (Audio.noVolume) return String.fromCodePoint(0xF0581)
                if (Audio.isLowVolume) return String.fromCodePoint(0xF057F)
                if (Audio.isMediumVolume) return String.fromCodePoint(0xF0580)

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

            color: Colors.widgetContainer

            Rectangle {
                y: parent.mapToItem(parent, 0, 0).y

                implicitWidth: Audio.volume * parent.implicitWidth
                implicitHeight: parent.implicitHeight

                radius: Config.volumeProgressBarRadius

                color: Colors.volume

                Behavior on implicitWidth {
                    NumberAnimation {
                        duration: 400
                        easing.type: Easing.OutCubic
                    }
                }
            }
        }
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
