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
            color: Colors.weather

            text: "󰖕"

            font {
                family: Config.textFontFamily
                pixelSize: Config.iconSize
            }
        }

        Text {
            color: Colors.weather

            text: isNaN(WeatherService.temperature) ? "-" : WeatherService.temperature + "°C"

            font {
                family: Config.textFontFamily
                pixelSize: Config.textSize
                weight: Config.textWeight
            }
        }
    }

    rightContent: RowLayout {
        spacing: Config.iconSpacing

        Text {
            color: Colors.weather

            text: "󰸊"

            font {
                family: Config.textFontFamily
                pixelSize: Config.iconSize
            }
        }

        Text {
            color: Colors.weather

            text: isNaN(WeatherService.humidity) ? "-" : WeatherService.humidity + "%"

            font {
                family: Config.textFontFamily
                pixelSize: Config.textSize
                weight: Config.textWeight
            }
        }
    }
}