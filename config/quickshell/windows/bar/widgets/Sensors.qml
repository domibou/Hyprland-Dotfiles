import QtQuick
import QtQuick.Layouts

import "../"
import "../../.."
import "../../../services"
import "../../components"


DoubleWidget {
    id: root

    property color cpuColorIndicator: {
        if (isNaN(SensorsService.cpuTemp))
            return Colors.sensors

        if (SensorsService.cpuTempCritical)
            return Colors.indicatorCritical

        if (SensorsService.cpuTempHigh)
            return Colors.indicatorHigh

        return Colors.sensors
    }

    property color gpuColorIndicator: {
        if (isNaN(SensorsService.gpuTemp))
            return Colors.sensors

        if (SensorsService.gpuTempCritical)
            return Colors.indicatorCritical

        if (SensorsService.gpuTempHigh)
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
            text: "CPU " + (isNaN(SensorsService.cpuTemp) ? "-" : `${SensorsService.cpuTemp}°C`)

            color: root.cpuColorIndicator

            font {
                family: Config.textFontFamily
                pixelSize: Config.textSize
                weight: Config.textWeight
            }
        }
    }

    rightContent: Text {
        text: "GPU " + (isNaN(SensorsService.gpuTemp) ? "-" : `${SensorsService.gpuTemp}°C`)

        color: root.gpuColorIndicator

        font {
            family: Config.textFontFamily
            pixelSize: Config.textSize
            weight: Config.textWeight
        }
    }
}