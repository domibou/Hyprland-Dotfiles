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

        Text {
            color: Colors.text

            text: Wifi.isWifiConnected ? "󰖩" : "󱚼"

            font {
                family: Config.textFontFamily
                pixelSize: Config.iconSize
            }
        }

        Text {
            color: Colors.text

            text: Wifi.isWifiConnected ? (Wifi.displayStrength ? Wifi.signalStrength : Wifi.networkName) : ""

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
        onTapped: Wifi.toggleMode()
    }
}