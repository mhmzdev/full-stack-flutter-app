part of 'cubit.dart';

class _AuthProvider {
  static Future<User?> register(Map<String, dynamic> body) async {
    try {
      final resp = await Api.ins.post(
        '/v1/users/register',
        data: body,
      );

      if (resp.statusCode == 205) {
        throw Exception('username ${body['username']} is already taken!');
      }

      final raw = resp.data;
      final Map<String, dynamic> data = raw['data'];
      return User.fromJson(data);
    } catch (e) {
      debugPrint('------ AuthProvider ------');
      debugPrint('------ $e ------');
      throw Exception(e.toString());
    }
  }
}
