pragma Singleton

import Quickshell

Singleton {
    readonly property real weatherWidgetLatitude: 46.74064
    readonly property real weatherWidgetLongitude: -71.45131

    readonly property int gapsOut: 25 // set to Hyprland config option gaps_out from general.lua

    readonly property int widgetWidthPadding: 30
    readonly property int widgetHeightPadding: widgetWidthPadding * 0.15

    readonly property int widgetMargin: 8 // condition to enforce in the config settings --> showWidgetContainer ? > Math.max(theValue, widgetSpacingMin) : 0
    readonly property int widgetSpacingMin: 8

    readonly property int widgetRadius: 30
    readonly property int widgetContainerRadius: widgetRadius * 1.8

    readonly property bool showWidgetContainer: true

    readonly property int widgetHoverAnimationDuration: 75

    readonly property int volumeBarHeight: 7
    readonly property int volumeBarWidth: 400
    readonly property int volumeProgressBarRadius: 4

    readonly property int textSize: 20
    readonly property int textWeight: 500
    readonly property string textFontFamily: "JetBrainsMono Nerd Font"

    readonly property int iconSize: 30
    readonly property int iconSpacing: 10
}
