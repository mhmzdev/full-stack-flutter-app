part of 'cubit.dart';

class _StoryRepository {
  Future<List<Story>> fetchAll() => _StoryProvider.fetchAll();
}
