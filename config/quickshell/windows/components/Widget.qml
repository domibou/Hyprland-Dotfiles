import QtQuick

import "../../"


Rectangle {
    implicitWidth: dataContainer.implicitWidth + Config.widgetWidthPadding
    implicitHeight: Config.widgetHeight
    
    radius: Config.widgetRadius
    border.width: Config.borderWidth
    border.color: Colors.accent
    color: defaultColor

    readonly property bool hovered: hoverHandler.hovered
    property bool clickable: false
    readonly property color defaultColor: clickable && hovered ? 
            Qt.rgba(Colors.widgetHover.r, Colors.widgetHover.g, Colors.widgetHover.b, Config.opacity) : 
            Qt.rgba(Colors.widget.r, Colors.widget.g, Colors.widget.b, Config.opacity) 

    property alias content: dataContainer.data

    Item {
        id: dataContainer

        implicitWidth: childrenRect.width
        implicitHeight: childrenRect.height

        anchors.centerIn: parent
    }

    HoverHandler {
        id: hoverHandler
    }

    Behavior on color {
        ColorAnimation { duration: Config.widgetHoverAnimationDuration }
    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: Config.animationDuration
            easing.type: Easing.OutCubic
        }
    }
}