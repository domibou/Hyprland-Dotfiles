pragma Singleton

import Quickshell
import QtQuick

Singleton {
    // Semantic colors
    readonly property color primary: "#b0b0b0"
    readonly property color overPrimary: "#202020"

    readonly property color secondary: "#a0a0a0"
    readonly property color overSecondary: "#202020"

    readonly property color tertiary: "#c0c0c0"
    readonly property color overTertiary: "#202020"

    readonly property color errorColor: "#b8b8b8"
    readonly property color overError: "#202020"

    readonly property color surface: "#181818"
    readonly property color overSurface: "#d8d8d8"
    readonly property color surfaceVariant: "#383838"
    readonly property color overSurfaceVariant: "#c0c0c0"

    readonly property color outline: "#707070"
    readonly property color outlineVariant: "#484848"

    // Derived/general colors
    readonly property color accent: primary

    readonly property color widget: windowBackground
    readonly property color widgetHover: "#282828"
    readonly property color widgetContainer: accent
    
    readonly property color separator: outlineVariant

    readonly property color windowBackground: surface

    readonly property color launcherPlaceholderTextColor: overSurfaceVariant

    // Constant colors
    readonly property color black: Qt.rgba(0, 0, 0)

    readonly property color nightlightToggledOn: Qt.rgba(1, 0.93, 0.56)
    readonly property color nightlightHoverToggledOn: Qt.rgba(1, 0.96, 0.76)
    readonly property color nightlightTextToggledOn: black

    readonly property color indicatorHigh: Qt.rgba(1, 0.48, 0)
    readonly property color indicatorCritical: Qt.rgba(1, 0, 0)

    // Widget colors
    readonly property color system: Config.showWidgetContainer ? accent : primary
    readonly property color workspaces: Config.showWidgetContainer ? accent : secondary
    readonly property color audio: Config.showWidgetContainer ? accent : secondary
    readonly property color nightLight: Config.showWidgetContainer ? accent : secondary
    readonly property color dateTime: Config.showWidgetContainer ? accent : tertiary
    readonly property color wifi: Config.showWidgetContainer ? accent : primary
    readonly property color sensors: Config.showWidgetContainer ? accent : primary
    readonly property color weather: Config.showWidgetContainer ? accent : primary
    readonly property color volume: Config.showWidgetContainer ? accent : tertiary
}