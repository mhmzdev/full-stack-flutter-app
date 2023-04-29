part of 'cubit.dart';

class _StoryProvider {
  static Future<Story> fetchAll() async {
    try {
      final Map<String, dynamic> raw = {};
      return Story.fromJson(raw);
    } catch (e) {
      debugPrint('------ StoryProvider ------');
      debugPrint('------ $e ------');
      throw Exception("Internal server error. Please try again!");
    }
  }
}
