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
      final resp = await Api.ins.put(
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

  ///
  static Future<String> uploadMedia(
    User profile,
    File? file, {
    required PictureType type,
  }) async {
    try {
      // storage
      final storage = FirebaseStorage.instance;

      String path, url = '';

      switch (type) {
        case PictureType.dp:
          path = profile.imageURL;
          break;
        case PictureType.cover:
          path = profile.coverURL;
          break;
        case PictureType.post:
          path = 'users/${profile.id}/posts';
          break;
        case PictureType.story:
          path = 'users/${profile.id}/stories';
          break;
        default:
          path = '';
          break;
      }

      if (file != null) {
        // in case of DP or cover, if image is already there
        // delete the one on storage, and replace it with new one
        if ((type == PictureType.dp || type == PictureType.cover) &&
            path.isNotEmpty) {
          await FirebaseStorage.instance.ref(path).delete();
        }

        // set path to a base `users/id` to re-upload dp or cover
        if (type == PictureType.dp || type == PictureType.cover) {
          path = 'users/${profile.id}';
        }

        final fileName = DateTime.now().millisecondsSinceEpoch.toString();
        path = '$path/$fileName';

        // if image size > 5 Mbs
        // 5,000,000 bytes == 5 megabytes
        final size = await file.length();
        if (size > 5000000) {
          throw Exception(
            'File size cannot be more than 5 MBs. Reduce the size and try again!',
          );
        }

        final ref = storage.ref(path);
        final task = await ref.putFile(file);
        url = await task.ref.getDownloadURL();
      }

      // if file is null, its means the function is REMOVING image
      // delete image path from storage and return empty URL
      // only for DP and Cover case
      else if ((type == PictureType.dp || type == PictureType.cover) &&
          file == null) {
        storage.ref(path).delete();
        url = path = '';
      }

      return url;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
