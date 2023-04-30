part of 'cubit.dart';

class _CommentProvider {
  static Future<List<Comment>> fetchAll() async {
    try {
      final res = await Api.ins.get('/v1/comments');
      final raw = res.data['data'] as List;

      final comments = List.generate(
        raw.length,
        (index) => Comment.fromJson(
          raw[index],
        ),
      );

      return comments;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.unknown) {
        throw Exception(Constants.connectionErrorMessage);
      }
      throw Exception("Internal server error. Please try again!");
    } catch (e) {
      debugPrint('------ CommentProvider ------');
      debugPrint('------ $e ------');
      throw Exception("Internal server error. Please try again!");
    }
  }
}
