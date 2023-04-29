part of 'cubit.dart';

class _StoryProvider {
  static Future<List<Story>> fetchAll() async {
    try {
      final res = await Api.ins.get('/v1/stories');
      final raw = res.data['data'] as List;

      final stories = List.generate(
        raw.length,
        (index) => Story.fromJson(
          raw[index],
        ),
      );

      return stories;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.unknown) {
        throw Exception(Constants.connectionErrorMessage);
      }
      throw Exception("Internal server error. Please try again!");
    } catch (e) {
      debugPrint('------ StoryProvider ------');
      debugPrint('------ $e ------');
      throw Exception("Internal server error. Please try again!");
    }
  }
}
