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

        implicitHeight: layout.implicitHeight + Config.gapsOut
        
        color: "transparent"

        HoverHandler {
            onHoveredChanged: {
                if (!hovered)
                    root.showBar = false
            }
        }

        RowLayout {
            id: layout
            
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                
                leftMargin: Config.gapsOut
                rightMargin: Config.gapsOut
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                implicitHeight: widgetGroup1.implicitHeight

                WidgetContainer {
                    id: widgetGroup1

                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                    }

                    Nightlight {}
                    Audio {}
                    Workspaces {}
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                implicitHeight: widgetGroup2.implicitHeight

                WidgetContainer {
                    id: widgetGroup2

                    anchors.centerIn: parent

                    DateTime {}
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                implicitHeight: widgetGroup3.implicitHeight

                WidgetContainer {
                    id: widgetGroup3

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