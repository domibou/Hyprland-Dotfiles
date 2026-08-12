import QtQuick
import QtQuick.Layouts
import "../.."

Rectangle {
    implicitWidth: layout.implicitWidth + Config.widgetContainerMargins * 2
    implicitHeight: layout.implicitHeight + Config.widgetContainerMargins * 2

    radius: Config.widgetContainerRadius
    color: Config.showWidgetContainer ? Colors.widgetContainer : "transparent"

    default property alias content: layout.data

    RowLayout {
        id: layout

        anchors.centerIn: parent

        spacing: Config.widgetContainerSpacing
    }
}