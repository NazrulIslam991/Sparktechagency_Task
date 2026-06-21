package com.example.sparktechagency_task

import android.content.*
import android.net.wifi.WifiManager
import android.os.*
import android.provider.Settings
import android.telephony.*
import android.hardware.*
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.net.InetAddress
import java.net.NetworkInterface

class MainActivity : FlutterActivity(), SensorEventListener {

    // Channel name used for communication between Flutter and Android native code
    private val CHANNEL = "device.pulse/channel"

    // Sensor manager for accessing device sensor
    private lateinit var sensorManager: SensorManager

    // Stores step count from step counter sensor
    private var stepCount = 0f

    // Telephony manager for SIM and network info
    private lateinit var telephonyManager: TelephonyManager

    // Stores current signal strength in dBm format
    private var signalDbm: String = "Unknown"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // ===================== STEP COUNTER SENSOR SETUP =====================
        sensorManager = getSystemService(Context.SENSOR_SERVICE) as SensorManager

        // Get step counter sensor
        val stepSensor = sensorManager.getDefaultSensor(Sensor.TYPE_STEP_COUNTER)

        // Register listener to continuously receive step updates
        if (stepSensor != null) {
            sensorManager.registerListener(this, stepSensor, SensorManager.SENSOR_DELAY_UI)
        }

        // ===================== MOBILE SIGNAL LISTENER =====================
        telephonyManager = getSystemService(TELEPHONY_SERVICE) as TelephonyManager

        // Listen for signal strength changes
        telephonyManager.listen(object : PhoneStateListener() {
            override fun onSignalStrengthsChanged(signalStrength: SignalStrength) {
                super.onSignalStrengthsChanged(signalStrength)

                // Convert GSM signal strength to dBm
                val gsm = signalStrength.gsmSignalStrength
                signalDbm =
                    if (gsm != 99) (-113 + 2 * gsm).toString() + " dBm"
                    else "Unknown"
            }
        }, PhoneStateListener.LISTEN_SIGNAL_STRENGTHS)

        // ===================== METHOD CHANNEL (FLUTTER <-> ANDROID) =====================
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->

                // Flutter calls this method name
                if (call.method == "getDeviceData") {

                    // HashMap to store all device data to send back to Flutter
                    val data = HashMap<String, Any>()

                    // ===================== BATTERY INFORMATION =====================
                    val batteryIntent = registerReceiver(
                        null,
                        IntentFilter(Intent.ACTION_BATTERY_CHANGED)
                    )

                    // Battery level (percentage)
                    val level = batteryIntent?.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) ?: 0
                    val scale = batteryIntent?.getIntExtra(BatteryManager.EXTRA_SCALE, -1) ?: 1
                    val batteryPct = level * 100 / scale

                    // Battery temperature (in tenths of degree Celsius)
                    val temp = batteryIntent?.getIntExtra(BatteryManager.EXTRA_TEMPERATURE, 0) ?: 0

                    // Battery health status code
                    val health = batteryIntent?.getIntExtra(BatteryManager.EXTRA_HEALTH, 0) ?: 0

                    data["batteryLevel"] = "$batteryPct%"
                    data["temperature"] = "${temp / 10}°C"
                    data["health"] = getBatteryHealth(health)

                    // ===================== STEP COUNT & ACTIVITY =====================
                    data["steps"] = stepCount.toInt().toString()

                    // Simple activity detection based on steps
                    data["activity"] = if (stepCount > 0) "Walking" else "Still"

                    // ===================== WIFI INFORMATION =====================
                    val wifiManager =
                        applicationContext.getSystemService(Context.WIFI_SERVICE) as WifiManager

                    val wifiInfo = wifiManager.connectionInfo

                    // WiFi SSID (network name)
                    var ssid = wifiInfo.ssid

                    // If WiFi is not available or hidden
                    if (ssid.contains("<unknown")) ssid = "Unknown"

                    data["ssid"] = ssid.replace("\"", "")

                    // WiFi signal strength (RSSI)
                    data["rssi"] = "${wifiInfo.rssi} dBm"

                    // Local IP address
                    data["ip"] = getIpAddress()

                    // ===================== SIM / MOBILE NETWORK =====================
                    data["carrier"] = telephonyManager.networkOperatorName
                    data["signal"] = signalDbm
                    data["simState"] = getSimState(telephonyManager.simState)

                    // ===================== DEVICE INFORMATION =====================
                    data["model"] = Build.MODEL
                    data["android"] = Build.VERSION.RELEASE

                    // Device name from settings or fallback to model name
                    data["deviceName"] =
                        Settings.Global.getString(contentResolver, "device_name")
                            ?: Build.MODEL

                    // Send data back to Flutter
                    result.success(data)
                }
            }
    }

    // ===================== STEP SENSOR CALLBACK =====================
    override fun onSensorChanged(event: SensorEvent?) {
        if (event != null) {
            // First value of step counter sensor is total steps since boot
            stepCount = event.values[0]
        }
    }

    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {}

    // ===================== BATTERY HEALTH CONVERTER =====================
    private fun getBatteryHealth(health: Int): String {
        return when (health) {
            BatteryManager.BATTERY_HEALTH_GOOD -> "Good"
            BatteryManager.BATTERY_HEALTH_OVERHEAT -> "Overheat"
            BatteryManager.BATTERY_HEALTH_DEAD -> "Dead"
            BatteryManager.BATTERY_HEALTH_OVER_VOLTAGE -> "Over Voltage"
            else -> "Unknown"
        }
    }

    // ===================== SIM STATE CONVERTER =====================
    private fun getSimState(state: Int): String {
        return when (state) {
            TelephonyManager.SIM_STATE_READY -> "Ready"
            TelephonyManager.SIM_STATE_ABSENT -> "Absent"
            else -> "Unknown"
        }
    }

    // ===================== GET LOCAL IP ADDRESS =====================
    private fun getIpAddress(): String {
        val interfaces = NetworkInterface.getNetworkInterfaces()

        for (intf in interfaces) {
            for (addr in intf.inetAddresses) {
                if (!addr.isLoopbackAddress && addr is InetAddress) {
                    return addr.hostAddress ?: ""
                }
            }
        }
        return "N/A"
    }
}