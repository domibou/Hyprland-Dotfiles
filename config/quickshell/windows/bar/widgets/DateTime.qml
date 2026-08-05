import QtQuick
import QtQuick.Layouts

import "../"
import "../../components"
import "../../../"
import "../../../services"


DoubleWidget {
    leftContent: RowLayout {
        spacing: Config.iconSpacing

        Text {
            text: "󰃰"

            color: Colors.dateTime

            font {
                family: Config.textFontFamily
                pixelSize: Config.iconSize
            }
        }

        Text {
            text: DateTime.time

            color: Colors.dateTime

            font {
                family: Config.textFontFamily
                pixelSize: Config.textSize
                weight: Config.textWeight
            }
        }
    }

    rightContent: Text {
        text: DateTime.date

        color: Colors.dateTime

        font {
            family: Config.textFontFamily
            pixelSize: Config.textSize
            weight: Config.textWeight
        }
    }
}
