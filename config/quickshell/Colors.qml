pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property color black: '#000000' // fixed
    readonly property color white: '#fffce8' // fixed
    readonly property color pink: '#ca779f' // fixed
    readonly property color purple: '#ae96d6' // fixed
    readonly property color cyan: '#7faddc' // fixe
    readonly property color yellow: '#ebcb8b' // fixed
    readonly property color red: '#ca7777' // fixed

    readonly property color accent: red

    readonly property color widget: Qt.rgba(0.02, 0.02, 0.02)
    readonly property color widgetHover: Qt.rgba(0.14, 0.14, 0.14)
    readonly property color widgetContainer: Qt.rgba(0.05, 0.05, 0.05)
    readonly property color doubleWidgetSeparator: '#1d1d1d'

    readonly property color nightlightToggledOn: Qt.rgba(1, 0.93, 0.56) // fixed
    readonly property color nightlightHoverToggledOn: Qt.rgba(1, 0.96, 0.76) // fixed
    readonly property color nightlightTextToggledOn: black // fixed

    readonly property color indicatorHigh: Qt.rgba(1, 0.48, 0) // fixed
    readonly property color indicatorCritical: Qt.rgba(1, 0, 0) // fixed

    readonly property color windowBackground: Qt.rgba(0.06, 0.06, 0.06, 0.7)

    readonly property color launcherPlaceholderTextColor: Qt.rgba(0.16, 0.16, 0.16) // fixed

    readonly property color nightLight: yellow // fixed
    readonly property color audio: red // fixed
    readonly property color dateTime: purple // fixed
    readonly property color wifi: cyan // fixed
    readonly property color sensors: yellow // fixed
    readonly property color weather: purple // fixed
    readonly property color volume: red // fixed
    readonly property color workspaces: cyan // fixed
}
