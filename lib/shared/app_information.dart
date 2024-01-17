import 'package:shared_preferences/shared_preferences.dart';

class AppInformation {
  AppInformation._();

  static SharedPreferences? _prefs;
  static String _tokenKey = 'user_token';
  static String? token;


  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    token = _prefs!.getString(_tokenKey) ?? '';
  }

  ///Initialize muss vorher aufgerufen werden!!
  static String? getUserToken() {
    return token;
  }

  ///Initialize muss vorher aufgerufen werden!!
  static void setUserToken(String newUserToken) {
    token = newUserToken;
    _prefs!.setString(_tokenKey, newUserToken);
  }
}
