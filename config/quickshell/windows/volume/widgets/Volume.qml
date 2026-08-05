import QtQuick
import QtQuick.Layouts

import "../"
import "../../.."
import "../../../services"
import "../../components"


Widget {
    id: widget

    content: RowLayout {
        id: layout

        spacing: Config.iconSpacing

        property int volumePercent: Math.round(Audio.volume * 100)

        Text {
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

            color: Colors.volume
        }

        Rectangle {
            implicitWidth: 400
            implicitHeight: widget.implicitHeight - Config.widgetMargin * 2

            radius: Config.volumeProgressBarRadius

            color: Colors.widgetContainer

            Rectangle {
                y: parent.mapToItem(parent, 0, 0).y

                implicitWidth: Audio.volume * parent.implicitWidth
                implicitHeight: widget.implicitHeight - Config.widgetMargin * 2

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
