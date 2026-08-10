pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property real opacity: 0.8

    readonly property color black: Qt.rgba(0, 0, 0)
    readonly property color white: Qt.rgba(1, 0.99, 0.91)
    readonly property color pink: '#ca779f'
    readonly property color purple: '#ae96d6'
    readonly property color cyan: '#88c0d0'
    readonly property color yellow: '#ebcb8b'
    readonly property color red: '#ca7777'

    readonly property color accent: red

    readonly property color widget: Qt.rgba(0.02, 0.02, 0.02, opacity)
    readonly property color widgetHover: Qt.rgba(0.14, 0.14, 0.14, opacity)
    readonly property color widgetToggledOn: Qt.rgba(1, 0.93, 0.56, opacity)
    readonly property color widgetHoverToggledOn: Qt.rgba(1, 0.96, 0.76, opacity)
    readonly property color widgetContainer: Qt.rgba(0.05, 0.05, 0.05, opacity)

    readonly property color indicatorHigh: Qt.rgba(1, 0.48, 0,opacity)
    readonly property color indicatorCritical: Qt.rgba(1, 0, 0,opacity)

    readonly property color windowBackground: Qt.rgba(0.06, 0.06, 0.06)

    readonly property color textAgainstToggledOn: black

    readonly property color nightLight: yellow
    readonly property color audio: red
    readonly property color dateTime: purple
    readonly property color wifi: cyan
    readonly property color sensors: yellow
    readonly property color weather: purple
    readonly property color volume: red
}
