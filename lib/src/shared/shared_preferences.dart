import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;
  static String? _token;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

//GETTERS

  static String? get token {
    return _prefs.getString('token') ?? _token;
  }

//SETTERS
  static set token(String? token) {
    _token = token;
    _prefs.setString('token', token!);
  }
}
