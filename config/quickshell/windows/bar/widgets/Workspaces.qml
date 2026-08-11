
import QtQuick
import Quickshell.Hyprland
import QtQuick.Layouts

import "../../.."
import "../../components"

Widget {
    id: container

    implicitWidth: layout.implicitWidth + Config.workspaceMargins

    clickable: false

    content: RowLayout {
        id: layout

        Repeater {
            id: repeater
            model: Hyprland.workspaces

            delegate: Widget {
                required property var modelData

                implicitHeight: container.implicitHeight - Config.workspaceMargins

                color: modelData.focused ? Colors.workspaces : defaultColor

                clickable: true

                content: Text {
                    text: modelData.id

                    font {
                        family: Config.textFontFamily
                        pixelSize: Config.textSize
                        weight: Config.textWeight
                    }

                    color: modelData.focused ? Colors.widget : Colors.workspaces
                }

                TapHandler {
                    onTapped: modelData.activate()
                }
            }
        }
    }
}