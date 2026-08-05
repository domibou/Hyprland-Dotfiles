pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property real opacity: 1.0

    readonly property color pink: '#ce5e94'
    readonly property color purple: '#ae96d6'
    readonly property color cyan: '#88c0d0'
    readonly property color yellow: '#ebcb8b'

    readonly property color widget: Qt.rgba(0.12, 0.12, 0.12, opacity)
    readonly property color widgetHover: Qt.rgba(0.14, 0.14, 0.14, opacity)
    readonly property color widgetToggledOn: Qt.rgba(1, 0.93, 0.56, opacity)
    readonly property color widgetHoverToggledOn: Qt.rgba(1, 0.96, 0.76, opacity)
    readonly property color widgetContainer: Qt.rgba(0.05, 0.05, 0.05, opacity)

    readonly property color indicatorHigh: Qt.rgba(1, 0.48, 0,opacity)
    readonly property color indicatorCritical: Qt.rgba(1, 0, 0,opacity)

    readonly property color border: Qt.rgba(0.05, 0.05, 0.05, opacity)

    readonly property color text: Qt.rgba(1, 1, 1, opacity)
    readonly property color textAgainstToggledOn: Qt.rgba(0, 0, 0, opacity)

    readonly property color nightLight: yellow
    readonly property color audio: pink
    readonly property color dateTime: purple
    readonly property color wifi: cyan
    readonly property color sensors: yellow
    readonly property color weather: purple
    readonly property color volume: purple
}
