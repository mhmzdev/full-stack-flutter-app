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

  static Future<Story> createStory(Map<String, dynamic> body) async {
    try {
      final resp = await Api.ins.post(
        '/v1/stories',
        data: body,
      );

      final raw = resp.data as Map<String, dynamic>;
      final data = raw['data'] as Map<String, dynamic>;

      final story = Story.fromJson(data);
      return story;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.unknown) {
        throw Exception(Constants.connectionErrorMessage);
      }
      debugPrint('------ PostProvider ------');
      debugPrint('------ $e ------');
      throw Exception("Internal server error. Please try again!");
    } catch (e) {
      debugPrint('------ PostProvider ------');
      debugPrint('------ $e ------');
      throw Exception("Internal server error. Please try again!");
    }
  }
}
