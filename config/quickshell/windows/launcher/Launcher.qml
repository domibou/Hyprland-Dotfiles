import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Effects

import "widgets"
import "../.."


LazyLoader {
    id: launcherLoader

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
                launcherLoader.active = false
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

            implicitWidth: layout.implicitWidth + Config.launcherMargins * 2
            implicitHeight: layout.implicitHeight + Config.launcherMargins * 2

            radius: appList.visible || noResults.visible ? Config.windowRadius : height / 2

            color: Colors.windowBackground

            ColumnLayout {
                id: layout

                anchors.centerIn: parent

                spacing: 25

                TextField {
                    id: input

                    focus: true

                    Layout.preferredWidth: 500
                    Layout.preferredHeight: 70
                    
                    leftPadding: 30
                    rightPadding: 30

                    Keys.onPressed: event => {
                        if (event.key === Qt.Key_Down) appList.next()
                        if (event.key === Qt.Key_Up) appList.prev();
                    }

                    onAccepted: {
                        appList.executeSelectedApp()

                        launcherLoader.active = false
                    }

                    onTextChanged: appList.filter(text)

                    placeholderText: "Launch"

                    font {
                        family: Config.textFontFamily
                        pixelSize: Config.textSize
                        weight: Config.textWeight
                    }

                    placeholderTextColor : Colors.accent
                    color: Colors.accent

                    background: Rectangle {
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        radius: height / 2

                        border.width: 4
                        border.color: Colors.accent

                        color: "transparent"
                    }
                }

                AppList {
                    id: appList

                    visible: foundMatches()

                    Layout.fillWidth: true
                    Layout.preferredHeight: 350
                }

                Text {
                    id: noResults

                    visible: !appList.foundMatches() && input.text

                    Layout.fillWidth: true
                    Layout.preferredHeight: 80

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    text: "No results"

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