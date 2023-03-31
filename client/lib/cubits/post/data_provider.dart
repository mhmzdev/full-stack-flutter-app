part of 'cubit.dart';

class _PostProvider {
  static Future<List<Post>> fetchAll() async {
    try {
      final Map<String, dynamic> raw = {};
      return [Post.fromJson(raw)];
    } catch (e) {
      debugPrint('------ PostProvider ------');
      debugPrint('------ $e ------');
      throw Exception("Internal Server Error");
    }
  }
}
