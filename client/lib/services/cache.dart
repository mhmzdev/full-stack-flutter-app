import 'package:client/services/api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static const _uidKey = "UID";
  static const _tokenKey = "JWT";

  static String? token;

  static SharedPreferences? _prefs;
  static FlutterSecureStorage secure = const FlutterSecureStorage();

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
    token = await secure.read(key: _tokenKey);
  }

  static int? get uid => _prefs?.getInt(_uidKey);

  static void setUid(int id) {
    _prefs?.setInt(_uidKey, id);
  }

  static void setToken(String t) {
    token = t;
    Api.setToken(t);
    secure.write(key: _tokenKey, value: t);
  }

  static void reset() {
    Api.setToken(null);
    secure.deleteAll();
    _prefs?.remove(_uidKey);
  }
}
