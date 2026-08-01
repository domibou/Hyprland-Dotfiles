import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import "../.."
import "widgets"


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
        screen: focusedScreen
        visible: showBar

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: Config.barMargins + Config.barHeight
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
                topMargin: Config.barMargins
                leftMargin: Config.barMargins
                rightMargin: Config.barMargins
            }

            // Rectangles encapsulated in fixed size Item elements, so that the RowLayout doesnt change proportions based on the varying sizes of the rectangles  
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Rectangle {
                    implicitWidth: widgetGroup1.implicitWidth + 2 * Config.widgetMargin
                    implicitHeight: Config.barHeight

                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                    }

                    radius: Config.barHeight / 2
                    color: Colors.barColor

                    RowLayout {
                        id: widgetGroup1

                        anchors {
                            fill: parent
                            margins: Config.widgetMargin
                        }

                        spacing: Config.widgetSpacing

                        Nightlight {}
                    }
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Rectangle {
                    implicitWidth: widgetGroup2.implicitWidth + 2 * Config.widgetMargin
                    implicitHeight: Config.barHeight

                    anchors.centerIn: parent

                    radius: Config.barHeight / 2
                    color: Colors.barColor

                    RowLayout {
                        id: widgetGroup2

                        anchors {
                            fill: parent
                            margins: Config.widgetMargin
                        }

                        spacing: Config.widgetSpacing

                        Time {}
                    }
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Rectangle {
                    implicitWidth: widgetGroup3.implicitWidth + 2 * Config.widgetMargin
                    implicitHeight: Config.barHeight

                    anchors {
                        right: parent.right
                        verticalCenter: parent.verticalCenter
                    }

                    radius: Config.barHeight / 2
                    color: Colors.barColor

                    RowLayout {
                        id: widgetGroup3

                        anchors {
                            fill: parent
                            margins: Config.widgetMargin
                        }

                        spacing: Config.widgetSpacing

                        Audio {}
                        Wifi {}
                    }
                }
            }
        }
    }
}