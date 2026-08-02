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

                text: Wifi.isWifiConnected ? (Wifi.displayName ? Wifi.networkName : Wifi.signalStrength) : ""

                font {
                    family: Config.textFontFamily
                    pixelSize: Config.textSize
                    weight: Config.textWeight
                }
            }
        }

    TapHandler {
        onTapped: Wifi.toggleMode()
    }
}