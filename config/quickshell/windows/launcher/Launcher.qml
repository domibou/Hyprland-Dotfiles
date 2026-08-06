import Quickshell
import QtQuick
import QtQuick.Layouts

import "../.."


PanelWindow {
    exclusiveZone: 0

    implicitWidth: 1000
    implicitHeight: 1000

    visible: false

    color: '#afc1c1c1'

    Column {
        spacing: 4

        Repeater {
            model: DesktopEntries.applications

            delegate: Text {
                required property var modelData
                text: modelData.name
            }
        }
    }
}