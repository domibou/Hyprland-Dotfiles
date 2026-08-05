import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import "widgets"
import "../.."
import "../components"


Scope {
    property var focusedScreen: undefined 

    property bool showBar: false

    PanelWindow {
        screen: focusedScreen
        visible: !showBar

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: 1
        color: "transparent"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: showBar = true
        }
    }

    PanelWindow {    
        id: bar

        screen: focusedScreen
        visible: showBar

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: Config.gapsOut + Config.widgetContainerHeight
        color: 'transparent'

        HoverHandler {
            id: hoverHandler
            onHoveredChanged: {
                if (!hovered) showBar = false
            }
        }

        RowLayout {
            anchors {
                fill: parent
                topMargin: Config.gapsOut
                leftMargin: Config.gapsOut
                rightMargin: Config.gapsOut
            }

             Item {
                 Layout.fillWidth: true
                 Layout.fillHeight: true           

                 WidgetContainer {
                     anchors {
                         left: parent.left
                         verticalCenter: parent.verticalCenter
                     }

                     Nightlight {}
                     Audio {}
                 }     
             }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                WidgetContainer {
                    anchors.centerIn: parent

                    DateTime {}
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                WidgetContainer {
                    anchors {
                        right: parent.right
                        verticalCenter: parent.verticalCenter
                    }

                    Wifi {}
                    Sensors {}
                    Weather {}
                }
            }
        }
    }
}