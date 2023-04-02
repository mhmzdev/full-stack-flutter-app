part of 'cubit.dart';

class _PostProvider {
  static Future<List<Post>> fetchAll() async {
    try {
      final res = await Api.ins.get('/v1/posts');
      final raw = res.data['data'] as List;

      final posts = List.generate(
        raw.length,
        (index) => Post.fromJson(
          raw[index],
        ),
      );

      return posts;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.unknown) {
        throw Exception(Constants.connectionErrorMessage);
      }
      throw Exception("Internal server error. Please try again!");
    } catch (e) {
      debugPrint('------ PostProvider ------');
      debugPrint('------ $e ------');
      throw Exception("Internal server error. Please try again!");
    }
  }

  static Future<Post> createPost(Map<String, dynamic> body) async {
    try {
      final resp = await Api.ins.post(
        '/v1/posts',
        data: body,
      );

      final raw = resp.data as Map<String, dynamic>;
      final data = raw['data'] as Map<String, dynamic>;

      final post = Post.fromJson(data);
      return post;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.unknown) {
        throw Exception(Constants.connectionErrorMessage);
      }
      throw Exception("Internal server error. Please try again!");
    } catch (e) {
      debugPrint('------ PostProvider ------');
      debugPrint('------ $e ------');
      throw Exception("Internal server error. Please try again!");
    }
  }

  static Future<void> editPost(Map<String, dynamic> body) async {
    try {
      final postId = body['id'] as int;
      final resp = await Api.ins.put(
        '/v1/posts/$postId',
        data: body,
      );

      debugPrint(resp.data.toString());
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.unknown) {
        throw Exception(Constants.connectionErrorMessage);
      }
      throw Exception("Internal server error. Please try again!");
    } catch (e) {
      debugPrint('------ PostProvider ------');
      debugPrint('------ $e ------');
      throw Exception("Internal server error. Please try again!");
    }
  }

  static Future<void> deletePost(Map<String, dynamic> body) async {
    try {
      final postId = body['postId'] as int;
      final imageUrl = body['imageURL'] as String;

      final resp = await Api.ins.delete(
        '/v1/posts/$postId',
      );

      FirebaseStorage.instance.refFromURL(imageUrl).delete();

      debugPrint(resp.data.toString());
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.unknown) {
        throw Exception(Constants.connectionErrorMessage);
      }
      throw Exception("Internal server error. Please try again!");
    } catch (e) {
      debugPrint('------ PostProvider ------');
      debugPrint('------ $e ------');
      throw Exception("Internal server error. Please try again!");
    }
  }
}
