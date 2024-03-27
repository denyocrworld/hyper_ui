import 'package:shared_preferences/shared_preferences.dart';

class DBService {
  static late SharedPreferences prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String? get(String key) {
    return prefs.getString(key);
  }

  static clear(String key) async {
    await prefs.remove(key);
  }

  static set(String key, String value) async {
    await prefs.setString(key, value);
  }
}
