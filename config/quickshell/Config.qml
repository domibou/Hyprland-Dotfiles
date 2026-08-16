pragma Singleton

import Quickshell

Singleton {
    readonly property real weatherWidgetLatitude: 46.74064
    readonly property real weatherWidgetLongitude: -71.45131

    readonly property int gapsOut: 18 // set to Hyprland config option gaps_out from general.lua
    
    readonly property real opacity: 0.4
    readonly property int borderWidth: 3

    readonly property bool showWidgetContainer: false

    readonly property int widgetContainerMargins: showWidgetContainer ? 4 : 0
    readonly property int widgetContainerSpacing: showWidgetContainer ? widgetContainerMargins :  10
    readonly property int widgetContainerRadius: widgetRadius * 1.8

    readonly property int widgetHeight: 45
    readonly property int widgetWidthPadding: 30
    readonly property int widgetRadius: 40

    readonly property int childWidgetMargins: 15

    readonly property int widgetHoverAnimationDuration: 75

    readonly property int volumeBarHeight: 7
    readonly property int volumeBarWidth: 400
    readonly property int volumeProgressBarRadius: 4

    readonly property int textSize: 20
    readonly property int textWeight: 500
    readonly property string textFontFamily: "JetBrainsMono"

    readonly property string osIcon: ""
    readonly property int iconSize: 30
    readonly property int iconSpacing: 10

    readonly property int imageIconSize: 50

    readonly property int windowMargins: 28
    readonly property int windowRadius: 40
    readonly property int windowShadowMargins: 30

    readonly property int launcherMargins: 20

    readonly property int animationDuration: 250
}
