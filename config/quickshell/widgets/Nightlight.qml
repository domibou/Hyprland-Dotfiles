import Quickshell
import QtQuick
import QtQuick.Layouts

import "../services"
import "../"


Rectangle {
    id: root

    implicitWidth: content.implicitWidth + Config.widgetWidthPadding
    implicitHeight: Config.barHeight - 2 * Config.widgetMargin
    radius: height / 2

    property int temp: Nightlight.defaultTemp

    color: Nightlight.active ? (hover.hovered ? Colors.backgroundHoverAgainstToggledOn : Colors.toggledOn) 
                        : (hover.hovered ? Colors.backgroundHover : Colors.background)

    Behavior on color {
        ColorAnimation { duration: Config.widgetHoverAnimationDuration }
    }

    border.width: 2
    border.color: Colors.border

    RowLayout {
        id: content

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

    HoverHandler {
        id: hover
    }

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