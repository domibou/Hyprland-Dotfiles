import Quickshell
import QtQuick
import QtQuick.Layouts

import "widgets"
import "../.."
import "../components"
import "../../services"

PanelWindow {
    property var focusedScreen: undefined
    
    screen: focusedScreen

    exclusiveZone: 0

    visible: Audio.volumePanelVisible || hoverHandler.hovered
    color: "transparent"

    anchors { bottom: true }

    implicitHeight: Config.widgetContainerHeight + (0.5 * Config.gapsOut)
    implicitWidth: volumeBar.implicitWidth

    WidgetContainer {
        id: volumeBar

        anchors.centerIn: parent
        anchors.top: parent.top
        
        Volume {}
    }
    
    HoverHandler {
        id: hoverHandler
    }
}