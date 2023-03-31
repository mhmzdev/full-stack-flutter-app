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
      throw Exception(e.toString());
    } catch (e) {
      debugPrint('------ PostProvider ------');
      debugPrint('------ $e ------');
      throw Exception(e.toString());
    }
  }

  static Future<void> createPost(Map<String, dynamic> body) async {
    try {
      final resp = await Api.ins.post(
        '/v1/posts',
        data: body,
      );

      debugPrint(resp.data.toString());
    } catch (e) {
      debugPrint('------ PostProvider ------');
      debugPrint('------ $e ------');
      throw Exception(e.toString());
    }
  }
}
