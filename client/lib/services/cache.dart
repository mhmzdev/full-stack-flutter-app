import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static const _uidKey = "UID";

  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static int? get uid => _prefs?.getInt(_uidKey);

  static void setUid(int id) {
    _prefs?.setInt(_uidKey, id);
  }

  static void resetUid() {
    _prefs?.remove(_uidKey);
  }
}
