import QtQuick
import QtQuick.Layouts

import "../.."


Rectangle {
    implicitWidth: dataContainer.implicitWidth + Config.widgetWidthPadding
    implicitHeight: Config.widgetContainerHeight - Config.widgetMargin * 2

    radius: Config.widgetRadius

    color: colorOverride ? colorOverride : colorDefault

    readonly property bool hovered: hoverHandler.hovered

    property bool clickable: false

    property color colorDefault: clickable ? (hoverHandler.hovered ? Colors.widgetHover : Colors.widget) : Colors.widget
    property var colorOverride: undefined

    property alias leftContent: left.data
    property alias rightContent: right.data

    RowLayout {
        id: dataContainer

        spacing: Config.iconSpacing

        anchors.centerIn: parent
        
        Item {
            id: left

            implicitWidth: childrenRect.width
            implicitHeight: childrenRect.height
        }

        Rectangle {
            implicitWidth: 2
            implicitHeight: parent.height * 0.6

            color: Colors.widgetContainer

            Layout.topMargin: 4
            Layout.bottomMargin: 4
        }

        Item {
            id: right

            implicitWidth: childrenRect.width
            implicitHeight: childrenRect.height    
        }
    }

    HoverHandler {
        id: hoverHandler
    }
    
    Behavior on implicitWidth {
        NumberAnimation {
            duration: 250
            easing.type: Easing.OutCubic
        }
    }

    Behavior on color {
        ColorAnimation { duration: Config.widgetHoverAnimationDuration }
    }
}