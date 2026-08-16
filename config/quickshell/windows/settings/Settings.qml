import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Effects

import "widgets"
import "../.."
import "../components"

LazyLoader {
    id: settingsLoader

    active: false

    FloatingWindow {
        onClosed: settingsLoader.active = false

        color: "transparent"

        Rectangle {
            id: content

            anchors.fill: parent
            color: Colors.windowBackground

            RowLayout {
                id: layout

                anchors.fill: parent
                anchors.margins: Config.windowMargins

                spacing: 20

                Categories {
                    Layout.preferredWidth: 300
                    Layout.preferredHeight: layout.height
                    //Layout.alignment: Qt.AlignVCenter
                }

                Rectangle {
                    Layout.preferredWidth: 5
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignVCenter

                    radius: width / 2
                    color: Colors.separator
                }

                ToggleSwitch {
                    Layout.alignment: Qt.AlignVCenter
                }
            }
        }
    }
}

// widgetContainer: box
// widgetBorder: box
// tileRadius: slider
// widgetRadius: slider
// gapsOut: slider