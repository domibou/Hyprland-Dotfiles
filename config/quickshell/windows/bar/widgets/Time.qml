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
            id: layout

            anchors.centerIn: parent

            Text {
                text: Time.displayDate ? Time.date : Time.time
                color: Colors.text

                font {
                    family: Config.textFontFamily
                    pixelSize: Config.textSize
                    weight: Config.textWeight
                }
            }
        }

    TapHandler {
        onTapped: Time.toggleMode()
    }
}
