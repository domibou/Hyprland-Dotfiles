pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Networking

Singleton {
    readonly property string networkName: isWifiConnected ? _activeNetwork.name : null

    readonly property var signalStrength: isWifiConnected ? _activeNetwork.signalStrength : 0.0

    readonly property bool isWifiConnected: _isWifiDevice && _activeNetwork 

    readonly property bool enabled: Networking.wifiEnabled

    property bool displayStrength: false

    readonly property var _activeDevice: {
        for (const device of Networking.devices.values) {
            if (device.connected) return device
        }
        return null
    }
    
    readonly property var _activeNetwork: {
        if (!_activeDevice) return null
      
        for (const network of _activeDevice.networks.values) {
            if (network.connected) return network
        }
        return null
    }

    readonly property bool _isWifiDevice: _activeDevice && _activeDevice.type === DeviceType.Wifi

    function toggleMode() {
        displayStrength = !displayStrength
    }
}   