import Quickshell
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Widgets

import "../../../"

ListView {
    clip: true
    currentIndex: -1
    interactive: false

    highlightFollowsCurrentItem: true
    highlight: Rectangle { color: Colors.highlight; radius: height / 2 }
    highlightMoveVelocity: 700

    model: filteredApps
    property var filteredApps: []
    readonly property var apps: DesktopEntries.applications.values

    delegate: Item {
        required property var modelData

        width: ListView.view.width
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

                color: Colors.white

                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
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
        if (currentIndex !== -1) filteredApps[currentIndex].execute()
    }
}
