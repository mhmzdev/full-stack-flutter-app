part of 'cubit.dart';

class _AuthProvider {
  static Future<User> register(Map<String, dynamic> body) async {
    try {
      final resp = await Api.ins.post('/v1/users/register');
      final Map<String, dynamic> raw = resp.data;
      return User.fromJson(raw);
    } catch (e) {
      debugPrint('------ AuthProvider ------');
      debugPrint('------ $e ------');
      throw Exception("Internal Server Error");
    }
  }
}
