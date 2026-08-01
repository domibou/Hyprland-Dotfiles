import QtQuick
import QtQuick.Layouts

import "../"
import "../../.."
import "../../../services"
import "components"


Pill {
    id: root

    content:
        RowLayout {
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