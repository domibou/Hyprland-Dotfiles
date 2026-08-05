import QtQuick
import QtQuick.Layouts

import "../"
import "../../.."
import "../../../services"
import "../../components"


DoubleWidget {
    leftContent: RowLayout {
        spacing: Config.iconSpacing

        Text {
            text: Wifi.isWifiConnected ? "󰖩" : "󱚼"

            color: Colors.wifi

            font {
                family: Config.textFontFamily
                pixelSize: Config.iconSize
            }
        }

        Text {
            text: Wifi.isWifiConnected ? Wifi.signalStrength : "-"

            color: Colors.wifi

            font {
                family: Config.textFontFamily
                pixelSize: Config.textSize
                weight: Config.textWeight
            }
        }
    }
    rightContent: Text {
        text: Wifi.isWifiConnected ? Wifi.networkName : "-"

        color: Colors.wifi

        font {
                family: Config.textFontFamily
                pixelSize: Config.textSize
                weight: Config.textWeight
        }
    }
}