import QtQuick

import "../"
import "../../.."
import "../../../services"


Text {
    text: Time.time
    color: Colors.text

    font {
        family: Config.textFontFamily
        pixelSize: Config.textSize
        weight: Config.textWeight
    }
}
