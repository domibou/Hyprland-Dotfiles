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
    highlightMoveVelocity: 700

    model: filteredApps
    property var filteredApps: []
    readonly property var apps: DesktopEntries.applications.values

    delegate: Item {
        required property int index
        required property var modelData

        width: list.width
        height: Config.imageIconSize + 10

        RowLayout {
            anchors {
                fill: parent
                leftMargin: 20
                rightMargin: 20
            }

            spacing: 30

            Image {
                source: "image://icon/" + modelData.icon
                fillMode: Image.PreserveAspectFit

                Layout.preferredWidth: Config.imageIconSize
                Layout.preferredHeight: Config.imageIconSize
            }

            Text {
                Layout.fillWidth: true

                text: modelData.name

                font {
                    family: Config.textFontFamily
                    pixelSize: Config.textSize
                    weight: Config.textWeight
                }

                color: index === currentIndex ? Colors.overPrimary : Colors.overSurface

                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight

                Behavior on color {
                    ColorAnimation {
                        duration: 200
                    }
                }
            }
        }
    }

    function next() {
        incrementCurrentIndex()
    }

    function prev() {
        decrementCurrentIndex()
    }

    function filter(input) {
        filteredApps = input ? apps.filter(app => app.name.toLowerCase().includes(input.toLowerCase())) : []
    }
    
    function foundMatches() {
        return filteredApps.length !== 0
    }

    function executeSelectedApp() {
        if (currentItem) currentItem.modelData.execute()
    }
}