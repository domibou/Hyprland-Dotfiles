import QtQuick
import QtQuick.Layouts
import "../.."

Rectangle {
    implicitWidth: layout.implicitWidth + 2 * Config.widgetMargin
    implicitHeight: Config.widgetContainerHeight

    radius: Config.widgetContainerHeight / 2
    color: Colors.widgetContainer

    default property alias content: layout.data

    RowLayout {
        id: layout

        anchors {
            fill: parent
            margins: Config.widgetMargin
        }

        spacing: Config.widgetSpacing
    }
}