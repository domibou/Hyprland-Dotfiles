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

    readonly property color accent: purple

    readonly property color widget: windowBackground
    readonly property color widgetHover: Qt.rgba(0.14, 0.14, 0.14)
    readonly property color widgetContainer: accent
    readonly property color doubleWidgetSeparator: '#1d1d1d'

    readonly property color nightlightToggledOn: Qt.rgba(1, 0.93, 0.56) // fixed
    readonly property color nightlightHoverToggledOn: Qt.rgba(1, 0.96, 0.76) // fixed
    readonly property color nightlightTextToggledOn: black // fixed

    readonly property color indicatorHigh: Qt.rgba(1, 0.48, 0) // fixed
    readonly property color indicatorCritical: Qt.rgba(1, 0, 0) // fixed

    readonly property color windowBackground: Qt.rgba(0.02, 0.02, 0.02)

    readonly property color launcherPlaceholderTextColor: Qt.rgba(0.16, 0.16, 0.16) // fixed

    readonly property color nightLight: Config.showWidgetContainer ? accent : yellow // fixed
    readonly property color audio: Config.showWidgetContainer ? accent : red // fixed
    readonly property color dateTime: Config.showWidgetContainer ? accent : purple // fixed
    readonly property color wifi: Config.showWidgetContainer ? accent : cyan // fixed
    readonly property color sensors: Config.showWidgetContainer ? accent : yellow // fixed
    readonly property color weather: Config.showWidgetContainer ? accent : purple // fixed
    readonly property color volume: Config.showWidgetContainer ? accent : red // fixed
    readonly property color workspaces: Config.showWidgetContainer ? accent : cyan // fixed
    readonly property color system: Config.showWidgetContainer ? accent : cyan // fixed
}
