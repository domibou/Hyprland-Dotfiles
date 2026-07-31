import QtQuick
import QtQuick.Layouts

import "../services"
import "../"

Rectangle {
    id: root

    implicitWidth: content.implicitWidth + Config.widgetWidthPadding
    implicitHeight: Config.barHeight - 2 * Config.widgetMargin
    radius: height / 2

    border.width: Config.borderWidth
    border.color: Colors.border

    color: hover.hovered ? Colors.backgroundHover : Colors.background

    Behavior on color {
        ColorAnimation { duration: Config.widgetHoverAnimationDuration }
    }

    RowLayout {
        id: content

        anchors.centerIn: parent
        spacing: Config.iconSpacing

        property int volumePercent: Math.round(Audio.volume * 100)

        Text {
            color: Colors.text

            text: {
                if (!Audio.ready) return String.fromCodePoint(0xF0581)
                if (Audio.muted) return "󰸈"

                if (content.volumePercent === 0) return String.fromCodePoint(0xF0581)
                if (content.volumePercent < 34) return String.fromCodePoint(0xF057F)
                if (content.volumePercent < 67) return String.fromCodePoint(0xF0580)

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
                return content.volumePercent + "%"
            }

            font {
                family: Config.textFontFamily
                pixelSize: Config.textSize
                weight: Config.textWeight
            }
        }
    }

    HoverHandler {
        id: hover
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