import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

import "widgets"
import "../.."


LazyLoader {
    id: wallpaperLoader

    active: false

    PanelWindow {
        exclusiveZone: 0
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

        implicitWidth: content.implicitWidth + Config.windowShadowMargins
        implicitHeight: content.implicitHeight + Config.windowShadowMargins

        color: "transparent"

        Shortcut {
            sequence: "Escape"

            onActivated: {
                wallpaperLoader.active = false
            }
        }

        MultiEffect {
            anchors.fill: content
            source: content

            shadowEnabled: true
            shadowColor: Colors.black
            shadowBlur: 0.5
            shadowVerticalOffset: 5
        }

        Rectangle {
            id: content

            anchors.centerIn: parent

            implicitWidth: layout.implicitWidth + Config.windowMargins * 2
            implicitHeight: layout.implicitHeight + Config.windowMargins * 2

            radius: Config.windowRadius
            border.width: Config.borderWidth
            border.color: Colors.accent
            color: Qt.rgba(Colors.windowBackground.r, Colors.windowBackground.g, Colors.windowBackground.b, Config.opacity)

            ColumnLayout {
                id: layout
                
                anchors.centerIn: parent

                spacing: 25

                RowLayout {
                    visible: wallpaperGrid.visible

                    spacing: 0

                    Text {
                        text: "Set wallpaper to: "

                        font {
                            family: Config.textFontFamily
                            pixelSize: Config.textSize
                            weight: Config.textWeight
                        }

                        color: Colors.accent
                    }

                    Text {
                        text: wallpaperGrid.currentItem?.modelData?.name ?? ""

                        font {
                            family: Config.textFontFamily
                            pixelSize: Config.textSize
                            weight: Config.textWeight
                        }

                        color: Colors.tertiary
                    }
                }

                WallpaperGrid {
                    id: wallpaperGrid

                    visible: foundWallpapers()
                }

                Text {
                    id: noWallpapers

                    visible: !wallpaperGrid.visible

                    Layout.fillWidth: true
                    Layout.preferredHeight: 80

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    text: "No wallpapers"

                    font {
                        family: Config.textFontFamily
                        pixelSize: Config.textSize
                        weight: Config.textWeight
                    }

                    color: Colors.accent
                }
            }
        }
    }
}