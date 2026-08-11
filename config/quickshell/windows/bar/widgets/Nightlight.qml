import Quickshell
import QtQuick
import QtQuick.Layouts

import "../"
import "../../.."
import "../../../services"
import "../../components"


Widget {
    clickable: true

    color: NightlightService.active
        ? (hovered
            ? Colors.nightlightHoverToggledOn
            : Colors.nightlightToggledOn)
        : defaultColor
        
    content:RowLayout {            
        spacing: Config.iconSpacing

        Text {
            text: "󰖔"

            color: NightlightService.active ? Colors.nightlightTextToggledOn : Colors.nightLight

            font {
                family: Config.textFontFamily
                pixelSize: Config.iconSize
            }
        }

        Text {
            visible: NightlightService.active

            text: NightlightService.active ? NightlightService.temp + "K" : ""  
            
            color: NightlightService.active ? Colors.nightlightTextToggledOn : Colors.black          

            font {
                family: Config.textFontFamily
                pixelSize: Config.textSize
                weight: Config.textWeight
            }
        }
    }

    TapHandler {
        onTapped: NightlightService.toggle()
    }

    // WheelHandler is bugged so we are using a MouseArea for now
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton
        hoverEnabled: false

        visible: NightlightService.active

        onWheel: (event) => {
            if (event.angleDelta.y > 0) NightlightService.warmer()
            else if (event.angleDelta.y < 0) NightlightService.cooler()
        }
    }
}