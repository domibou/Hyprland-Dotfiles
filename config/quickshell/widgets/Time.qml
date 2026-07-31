import QtQuick

import "../services"
import "../"


Text {
    id: content

    anchors.centerIn: parent

    text: Time.time
    color: Colors.text

    font {
        family: Config.textFontFamily
        pixelSize: Config.textSize
        weight: Config.textWeight
    }
}
