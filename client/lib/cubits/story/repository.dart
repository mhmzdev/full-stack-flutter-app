part of 'cubit.dart';

class _StoryRepository {
  Future<List<Story>> fetchAll() => _StoryProvider.fetchAll();

  Future<Story> createStory(
    int uid,
    bool? hasImage,
    String? imageURL,
    bool? hasVideo,
    String? videoURL,
  ) async {
    final payload = {
      'uid': uid,
      'hasImage': hasImage,
      'hasVideo': hasVideo,
      'imageURL': imageURL,
      'videoURL': videoURL,
    };

    return _StoryProvider.createStory(payload);
  }

  Future<void> deleteStory(int storyId, String imageUrl) {
    final payload = {
      'storyId': storyId,
      'imageURL': imageUrl,
    };

    return _StoryProvider.deleteStory(payload);
  }
}
