pragma Singleton

import Quickshell

Singleton {
    readonly property real weatherWidgetLatitude: 46.74064
    readonly property real weatherWidgetLongitude: -71.45131

    // Set to Hyprland config option gaps_out from general.lua
    readonly property int gapsOut: 25

    readonly property int widgetContainerMargins: gapsOut
    readonly property int widgetContainerHeight: 60
    
    readonly property int widgetWidthPadding: 30
    readonly property int widgetMargin: 12
    readonly property int widgetHoverAnimationDuration: 75
    readonly property int widgetRadius: 12
    readonly property int widgetContainerRadius: 20

    readonly property int volumeProgressBarRadius: 4

    readonly property int textSize: 20
    readonly property int textWeight: 500
    readonly property string textFontFamily: "JetBrainsMono Nerd Font"

    readonly property int iconSize: 30
    readonly property int iconSpacing: 10
}
