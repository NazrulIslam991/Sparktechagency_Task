import 'package:flutter/services.dart';

class DeviceInfoService {
  static const platform = MethodChannel('device.pulse/channel');

  static Future<Map<String, dynamic>> getDeviceData() async {
    final data = await platform.invokeMethod('getDeviceData');
    return Map<String, dynamic>.from(data);
  }
}
