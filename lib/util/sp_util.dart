import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static SpUtil get instance => _instance;
  static late final SpUtil _instance = SpUtil();

  SpUtil() {
    _init();
  }

  late SharedPreferences _prefs;

  void _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  void setString(String key, String value) {
    _prefs.setString(key, value);
  }
}
