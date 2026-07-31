import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import "../"

Scope {
    readonly property var focusedScreen: {
        const name = Hyprland.focusedMonitor?.name
        return Quickshell.screens.find(s => s.name === name)
            ?? (Quickshell.screens.length > 0 ? Quickshell.screens[0] : null)
    }

    property bool showBar: false

    PanelWindow {
        screen: focusedScreen
        visible: !showBar

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: 3
        color: "transparent"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: showBar = true
        }
    }

    PanelWindow {
        id: hotEdge
        
        screen: focusedScreen
        visible: showBar

        margins {
            top: Config.barMargins
            left: Config.barMargins
            right: Config.barMargins
        }

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: Config.barHeight
        color: "transparent"

        HoverHandler {
            onHoveredChanged: {
                if (!hovered) showBar = false
            }
        }

        Rectangle {
            id: bar

            anchors.fill: parent

            border.width: Config.borderWidth
            border.color: Colors.border

            radius: Config.barHeight / 2
            color: '#421e1e2e'

            Item {
                anchors.fill: parent

                RowLayout {
                    anchors.left: parent.left
                    anchors.leftMargin: Config.widgetMargin
                    anchors.verticalCenter: parent.verticalCenter

                    spacing: 8

                    Nightlight {}
                }

                Time {
                    anchors.centerIn: parent
                }

                RowLayout {
                    anchors.right: parent.right
                    anchors.rightMargin: Config.widgetMargin
                    anchors.verticalCenter: parent.verticalCenter

                    spacing: 8

                    Audio {}
                    Wifi {}
                }
            }
        }
    }
}