import QtQuick
import QtQuick.Layouts

import "../"
import "../../.."
import "../../../services"
import "../../components"


DoubleWidget {
    id: root

    property color cpuColorIndicator: {
        if (isNaN(Sensors.cpuTemp))
            return Colors.sensors

        if (Sensors.cpuTempCritical)
            return Colors.indicatorCritical

        if (Sensors.cpuTempHigh)
            return Colors.indicatorHigh

        return Colors.sensors
    }

    property color gpuColorIndicator: {
        if (isNaN(Sensors.gpuTemp))
            return Colors.sensors

        if (Sensors.gpuTempCritical)
            return Colors.indicatorCritical

        if (Sensors.gpuTempHigh)
            return Colors.indicatorHigh

        return Colors.sensors
    }
            
    leftContent: RowLayout {
        spacing: Config.iconSpacing

        Text {
            text: ""

            color: Colors.sensors

            font {
                family: Config.textFontFamily
                pixelSize: Config.iconSize
            }
        }

        Text {
            text: "CPU " + (isNaN(Sensors.cpuTemp) ? "-" : `${Sensors.cpuTemp}°C`)

            color: root.cpuColorIndicator

            font {
                family: Config.textFontFamily
                pixelSize: Config.textSize
                weight: Config.textWeight
            }
        }
    }

    rightContent: Text {
        text: "GPU " + (isNaN(Sensors.gpuTemp) ? "-" : `${Sensors.gpuTemp}°C`)

        color: root.gpuColorIndicator

        font {
            family: Config.textFontFamily
            pixelSize: Config.textSize
            weight: Config.textWeight
        }
    }
}