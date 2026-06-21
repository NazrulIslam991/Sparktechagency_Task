import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ReceivedStorageService {
  static const String key = "received_history";

  /// *********************  Save received data *************************
  static Future<void> saveReceivedData(
    Map<String, dynamic> data,
    String fromIp,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final List<String> existing = prefs.getStringList(key) ?? [];

    final newEntry = {
      "device": data["deviceName"] ?? "Unknown Device",
      "time": DateTime.now().toString(),
      "ip": fromIp,
      "data": jsonEncode(data),
    };

    existing.insert(0, jsonEncode(newEntry));

    await prefs.setStringList(key, existing);
  }

  /// **********************  Get all history ******************************
  static Future<List<Map<String, dynamic>>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String> stored = prefs.getStringList(key) ?? [];

    return stored.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
  }

  /// ********************** Clear history ***************************
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
