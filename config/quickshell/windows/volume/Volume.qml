import Quickshell
import QtQuick

import "widgets"
import "../.."
import "../components"
import "../../services"

PanelWindow {
    exclusiveZone: 0
    mask: Region {}

    visible: Audio.volumePanelVisible
    
    color: "transparent"

    anchors { bottom: true }

    implicitHeight: volumeBar.implicitHeight + Config.gapsOut * 0.5
    implicitWidth: volumeBar.implicitWidth

    WidgetContainer {
        id: volumeBar

        anchors {
            top: parent.top
        }
        
        Volume {}
    }
}