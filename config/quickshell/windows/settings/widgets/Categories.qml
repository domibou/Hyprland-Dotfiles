import Quickshell
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Widgets

import "../../../"

ListView {
    id: list
    clip: true
    interactive: false

    currentIndex: -1
    highlightFollowsCurrentItem: true
    highlight: Rectangle { color: Colors.accent; radius: height / 2 }
    highlightMoveVelocity: 1500

    model: categories
    property var categories: ['category 1', 'category 2']

    delegate: Item {
        required property int index
        required property var modelData

        width: list.width
        height: 80

        HoverHandler {
            onHoveredChanged: {
                if (hovered)
                    list.currentIndex = index
            }
        }

        TapHandler {
            onTapped: {
                console.log(modelData)
            }
        }

        RowLayout {           
            anchors {
                fill: parent
                leftMargin: 5
                rightMargin: 5
            }

            spacing: 30

            Text {
                horizontalAlignment: Text.AlignHLeft
                verticalAlignment: Text.AlignVCenter
                Layout.fillWidth: true
                Layout.fillHeight: true

                text: modelData

                color: Colors.accent

                font {
                    family: Config.textFontFamily
                    pixelSize: Config.iconSize
                }
            }
        }
    }
}
