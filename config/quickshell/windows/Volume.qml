import Quickshell
import QtQuick
import QtQuick.Layouts

import "../"
import "../services"


PanelWindow {
    property var focusedScreen: undefined
    
    screen: focusedScreen
    exclusiveZone: 0

    visible: Audio.volumePanelVisible || hoverHandler.hovered

    anchors { right: true }

    implicitHeight: 500
    
    RowLayout {
        anchors.right: parent.right
        anchors.rightMargin: Config.widgetMargin
        anchors.verticalCenter: parent.verticalCenter

        spacing: Config.widgetSpacing

        Text {
            text: "yeet"

            font {
                family: Config.textFontFamily
                pixelSize: Config.iconSize
            }
        
        }

        Text {
            text: "yeboi"

            font {
                family: Config.textFontFamily
                pixelSize: Config.iconSize
            }
        }
    }

    HoverHandler {
        id: hoverHandler
    }
}