import QtQuick
import QtQuick.Layouts
import "../.."

Rectangle {
    implicitWidth: layout.implicitWidth + Config.widgetMargin * 2
    implicitHeight: Config.widgetContainerHeight

    radius: Config.widgetContainerRadius
    color: Colors.widgetContainer

    default property alias content: layout.data

    RowLayout {
        id: layout

        anchors {
            centerIn: parent
        }

        spacing: Config.widgetMargin
    }
}