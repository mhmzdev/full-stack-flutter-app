part of 'cubit.dart';

class _PostProvider {
  static Future<List<Post>> fetchAll() async {
    try {
      final Map<String, dynamic> raw = {};
      return [Post.fromJson(raw)];
    } catch (e) {
      debugPrint('------ PostProvider ------');
      debugPrint('------ $e ------');
      throw Exception(e.toString());
    }
  }

  static Future<void> createPost(Map<String, dynamic> body) async {
    try {
      await Api.ins.post(
        '/v1/posts/create',
        data: body,
      );
    } catch (e) {
      debugPrint('------ PostProvider ------');
      debugPrint('------ $e ------');
      throw Exception(e.toString());
    }
  }
}
