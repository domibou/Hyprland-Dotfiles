import Quickshell
import QtQuick
import QtQuick.Layouts

import "widgets"
import "../.."
import "../components"

Scope {
    id: root

    required property var screen
    property bool showBar: false

    PanelWindow {
        screen: root.screen

        visible: !root.showBar

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: 0

        color: "transparent"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: root.showBar = true
        }
    }

    PanelWindow {
        screen: root.screen

        visible: root.showBar

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: barLayout.implicitHeight + Config.gapsOut
        
        color: "transparent"

        RowLayout {
            id: barLayout

            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                
                leftMargin: Config.gapsOut
                rightMargin: Config.gapsOut
            }

            Item {
                id: barLeft

                Layout.fillWidth: true

                implicitHeight: barLeftLayout.implicitHeight

                RowLayout {
                    id: barLeftLayout 

                    anchors.fill: parent
                        
                    WidgetContainer {
                        id: widgetGroup1

                        System {}
                    }
                
                    WidgetContainer {
                        id: widgetGroup2
                        
                        Workspaces {}
                        Audio {}
                        Nightlight {}
                    }
                }
            }

            Item {
                id: barCenter

                Layout.fillWidth: true

                implicitHeight: widgetGroup3.implicitHeight

                WidgetContainer {
                    id: widgetGroup3

                    anchors.centerIn: parent

                    DateTime {}
                }
            }

            Item {
                id: barRight

                Layout.fillWidth: true

                implicitHeight: widgetGroup4.implicitHeight

                WidgetContainer {
                    id: widgetGroup4

                    anchors.right: parent.right

                    Wifi {}
                    Sensors {}
                    Weather {}
                }      
            }
        }

        HoverHandler {
            onHoveredChanged: {
                if (!hovered)
                    root.showBar = false
            }
        }
    }
}