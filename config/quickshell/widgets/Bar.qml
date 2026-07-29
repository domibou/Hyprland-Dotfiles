import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Scope {
    readonly property var focusedScreen: {
        const name = Hyprland.focusedMonitor?.name
        return Quickshell.screens.find(s => s.name === name)
            ?? (Quickshell.screens.length > 0 ? Quickshell.screens[0] : null)
    }

    property bool showBar: false

    PanelWindow {
        screen: focusedScreen

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: 1
        visible: !showBar
        color: "transparent"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: showBar = true
        }
    }

    PanelWindow {
        screen: focusedScreen

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: 60
        visible: showBar
        color: "transparent"

        RowLayout {
            z: 0
            anchors.fill: parent
            anchors.leftMargin: 25
            anchors.rightMargin: 25

            Item { Layout.fillWidth: true }
            Time {}

            Item { Layout.fillWidth: true }
            Volume {}
        }

        MouseArea {
            z: 1
            anchors.fill: parent
            hoverEnabled: true
            onExited: showBar = false
        }
    }
}