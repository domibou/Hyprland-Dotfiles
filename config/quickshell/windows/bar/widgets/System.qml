import Quickshell
import QtQuick
import QtQuick.Layouts

import "../../.."
import "../../../services"
import "../../components"

Widget {
    id: container

    implicitWidth: SystemService.showOptions ? loader.implicitWidth + Config.childWidgetMargins :  loader.implicitWidth + Config.widgetWidthPadding

    clickable: SystemService.showOptions ? false : true

    Loader {
        id: loader

        anchors.centerIn: parent

        sourceComponent: SystemService.showOptions
            ? optionsComponent
            : defaultComponent

        Component {
            id: optionsComponent

            RowLayout {
                Widget {
                    implicitHeight: container.implicitHeight - Config.childWidgetMargins
                    clickable: true

                    content: Text {
                        text: "shutdown"
                        color: Colors.system

                        font {
                            family: Config.textFontFamily
                            pixelSize: Config.textSize
                            weight: Config.textWeight
                        }
                    }

                    TapHandler {
                        onTapped: console.log("shut")
                    }
                }

                Widget {
                    implicitHeight: container.implicitHeight - Config.childWidgetMargins
                    clickable: true

                    content: Text {
                        text: "reboot"
                        color: Colors.system

                        font {
                            family: Config.textFontFamily
                            pixelSize: Config.textSize
                            weight: Config.textWeight
                        }
                    }

                    TapHandler {
                        onTapped: {console.log("reboot")}
                    }
                }
            }
        }

        Component {
            id: defaultComponent

            RowLayout {
                spacing: Config.iconSpacing

                Text {
                    text: Config.osIcon

                    font {
                        family: Config.textFontFamily
                        pixelSize: Config.iconSize
                    }

                    color: Colors.system
                }

                Text {
                    text: Quickshell.env("USER")

                    font {
                        family: Config.textFontFamily
                        pixelSize: Config.textSize
                        weight: Config.textWeight
                    }

                    color: Colors.system///
                }
            }
        }
    }

    TapHandler {
        enabled: !SystemService.showOptions

        onTapped: SystemService.toggleMode()
    }

    HoverHandler {
        onHoveredChanged: {
            if (!hovered)
                SystemService.showOptions = false
        }
    }
}