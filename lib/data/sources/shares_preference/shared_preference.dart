import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData {
  static Future<void> setToken(String? token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('auth_token', "$token");
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('auth_token');
  }

  // ================== REFRESH TOKEN  ==================
  static Future<void> setRefreshToken(String? refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('refresh_token', "$refreshToken");
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('refresh_token');
  }

  static Future<void> removeRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('refresh_token');
  }

  static Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('role');
  }

  Future<void> setRole(String? role) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('role', "$role");
  }

  static Future<void> removeRole() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('role');
  }

  // EMAIL
  static Future<String?> getEmailId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  static Future<void> setEmailId(String? id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('email', id ?? "No email_id");
  }

  Future<void> removeEmailId() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
  }

  //-----------------------USER ID------------------------
  static Future<void> setUserId(String? userId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', "$userId");
  }

  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }

  static Future<void> removeUserId() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user_id');
  }

  /// ********************** theme **************************
  static Future<void> setThemeStatus(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_dark_theme', isDark);
  }

  static Future<bool> getThemeStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_dark_theme') ?? true;
  }

  /// ********************** Language **************************
  static Future<void> setLanguageCode(String code) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language_code', code);
  }

  static Future<String> getLanguageCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('language_code') ?? 'en';
  }
}
