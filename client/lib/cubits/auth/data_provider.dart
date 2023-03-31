part of 'cubit.dart';

enum PictureType {
  dp,
  cover,
  post,
  story,
}

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
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.unknown) {
        throw Exception(Constants.connectionErrorMessage);
      }
      throw Exception(e.toString());
    } catch (e) {
      debugPrint('------ AuthProvider ------');
      debugPrint('------ $e ------');
      throw Exception(e.toString());
    }
  }

  static Future<List<User>> fetchAll() async {
    try {
      final resp = await Api.ins.get(
        '/v1/users',
      );

      final raw = resp.data;
      final data = raw['data'] as List;
      final users = List.generate(
        data.length,
        (index) => User.fromJson(
          data[index],
        ),
      );

      return users;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.unknown) {
        throw Exception(Constants.connectionErrorMessage);
      }
      throw Exception(e.toString());
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
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.unknown) {
        throw Exception(Constants.connectionErrorMessage);
      }
      throw Exception(e.toString());
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
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.unknown) {
        throw Exception(Constants.connectionErrorMessage);
      }
      throw Exception(e.toString());
    } catch (e) {
      debugPrint('------ AuthProvider ------');
      debugPrint('------ $e ------');
      throw Exception(e.toString());
    }
  }

  static Future<User> update(Map<String, dynamic> body) async {
    try {
      final resp = await Api.ins.put(
        '/v1/users/update',
        data: body,
      );

      if (resp.statusCode != 200) {
        throw Exception(resp.data['message']);
      }

      final raw = resp.data;
      final Map<String, dynamic> data = raw['data'];
      return User.fromJson(data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.unknown) {
        throw Exception(Constants.connectionErrorMessage);
      }
      throw Exception(e.toString());
    } catch (e) {
      debugPrint('------ AuthProvider ------');
      debugPrint('------ $e ------');
      throw Exception(e.toString());
    }
  }

  static Future<User> updatePicture(Map<String, dynamic> body) async {
    try {
      final resp = await Api.ins.post(
        '/v1/users/photo',
        data: body,
      );

      final raw = resp.data;
      final Map<String, dynamic> data = raw['data'];
      return User.fromJson(data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.unknown) {
        throw Exception(Constants.connectionErrorMessage);
      }
      throw Exception(e.toString());
    } catch (e) {
      debugPrint('------ AuthProvider ------');
      debugPrint('------ $e ------');
      throw Exception(e.toString());
    }
  }
}
