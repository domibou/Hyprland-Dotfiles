import Quickshell
import QtQuick
import QtQuick.Layouts

import "../"
import "../../.."
import "../../../services"
import "components"


Pill {
    property int temp: Nightlight.defaultTemp

    colorOverride: Nightlight.active
        ? (hovered
            ? Colors.widgetHoverToggledOn
            : Colors.widgetToggledOn)
        : undefined
        
    content:
        RowLayout {
            anchors.centerIn: parent
            spacing: Config.iconSpacing

            Text {
                text: "󰖔"

                color: Nightlight.active ? Colors.textAgainstToggledOn : Colors.text

                font {
                    family: Config.textFontFamily
                    pixelSize: Config.iconSize
                }
            }

            Text {
                visible: Nightlight.active

                text: Nightlight.active ? Nightlight.temp + "K" : ""  
                
                color: Nightlight.active ? Colors.textAgainstToggledOn : Colors.text          

                font {
                    family: Config.textFontFamily
                    pixelSize: Config.textSize
                    weight: Config.textWeight
                }
            }
        }

    TapHandler {
        onTapped: Nightlight.toggle()
    }

    // WheelHandler is bugged so we are using a MouseArea for now
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton
        hoverEnabled: false

        visible: Nightlight.active

        onWheel: (event) => {
            if (event.angleDelta.y > 0) Nightlight.warmer()
            else if (event.angleDelta.y < 0) Nightlight.cooler()
        }
    }
}