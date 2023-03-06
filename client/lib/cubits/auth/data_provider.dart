part of 'cubit.dart';

class _AuthProvider {
  static Future<User> fetch(Map<String, dynamic> body) async {
    try {
      final uid = body['uid'];
      final resp = await Api.ins.get(
        '/v1/users/$uid',
        data: body,
      );

      if (resp.statusCode != 200) {
        if (resp.statusCode == 205) {
          Cache.resetUid();
        }
        throw Exception(resp.data['message']);
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

  static Future<User> login(Map<String, dynamic> body) async {
    try {
      final resp = await Api.ins.post(
        '/v1/users/login',
        data: body,
      );

      if (resp.statusCode != 200) {
        throw Exception(resp.data['message']);
      }

      final raw = resp.data;
      final Map<String, dynamic> data = raw['data'];
      final user = User.fromJson(data);

      Cache.setUid(user.id);

      return user;
    } catch (e) {
      debugPrint('------ AuthProvider ------');
      debugPrint('------ $e ------');
      throw Exception(e.toString());
    }
  }

  static Future<User> register(Map<String, dynamic> body) async {
    try {
      final resp = await Api.ins.post(
        '/v1/users/register',
        data: body,
      );

      if (resp.statusCode != 200) {
        throw Exception(resp.data['message']);
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
