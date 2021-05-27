import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// 本地存储
class SpUtil {
  static SpUtil _instance = SpUtil._();

  factory SpUtil() => _instance;
  static late SharedPreferences _preferences;

  SpUtil._();

  static Future<void> init() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  Future<bool> setJson(String key, dynamic obj) {
    String jsonStr = jsonEncode(obj);
    return _preferences.setString(key, jsonStr);
  }

  dynamic getJson(String key) {
    String? jsonStr = _preferences.getString(key);
    return jsonStr == null ? null : jsonDecode(jsonStr);
  }

  Future<bool> setBool(String key, bool value) {
    return _preferences.setBool(key, value);
  }

  bool getBool(String key) {
    bool? val = _preferences.getBool(key);
    return val == null ? false : val;
  }

  Future<bool> remove(String key) {
    return _preferences.remove(key);
  }
}
