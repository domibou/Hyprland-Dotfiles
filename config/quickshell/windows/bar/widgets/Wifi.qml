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
            text: WifiService.isWifiConnected ? "󰖩" : "󱚼"

            color: Colors.wifi

            font {
                family: Config.textFontFamily
                pixelSize: Config.iconSize
            }
        }

        Text {
            text: WifiService.isWifiConnected ? WifiService.signalStrength : "-"

            color: Colors.wifi

            font {
                family: Config.textFontFamily
                pixelSize: Config.textSize
                weight: Config.textWeight
            }
        }
    }
    rightContent: Text {
        text: WifiService.isWifiConnected ? WifiService.networkName : "-"

        color: Colors.wifi

        font {
                family: Config.textFontFamily
                pixelSize: Config.textSize
                weight: Config.textWeight
        }
    }
}