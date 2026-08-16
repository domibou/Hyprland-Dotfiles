
import QtQuick
import Quickshell.Hyprland
import QtQuick.Layouts

import "../../.."
import "../../components"

Widget {
    id: container

    clickable: false

    implicitWidth: layout.implicitWidth + Config.childWidgetMargins

    content: RowLayout {
        id: layout

        Repeater {
            id: repeater
            
            model: Hyprland.workspaces

            delegate: Widget {
                required property var modelData

                clickable: true

                implicitHeight: container.implicitHeight - Config.childWidgetMargins

                color: modelData.focused ? Colors.workspaces : defaultColor

                border.width: 0

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