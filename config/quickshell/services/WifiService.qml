pragma Singleton

import Quickshell
import Quickshell.Networking

Singleton {
    readonly property string networkName: isWifiConnected ? activeNetwork.name : null

    readonly property var signalStrength: isWifiConnected ? activeNetwork.signalStrength : 0.0

    readonly property bool isWifiConnected: isWifiDevice && activeNetwork 

    readonly property bool isWifiDevice: activeDevice && activeDevice.type === DeviceType.Wifi

    readonly property var activeDevice: {
        for (const device of Networking.devices.values) {
            if (device.connected) return device
        }
        return null
    }
    
    readonly property var activeNetwork: {
        if (!activeDevice) return null
      
        for (const network of activeDevice.networks.values) {
            if (network.connected) return network
        }
        return null
    }
}   