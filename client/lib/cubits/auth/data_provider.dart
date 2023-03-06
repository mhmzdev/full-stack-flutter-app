part of 'cubit.dart';

class _AuthProvider {
  static Future<User> register() async {
    try {
      final Map<String, dynamic> raw = {};
      return User.fromJson(raw);
    } catch (e) {
      debugPrint('------ AuthProvider ------');
      debugPrint('------ $e ------');
      throw Exception("Internal Server Error");
    }
  }
}
