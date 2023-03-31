part of 'cubit.dart';

class _PostRepository {
  Future<List<Post>> fetchAll() => _PostProvider.fetchAll();

  Future<void> createPost(
    String uid,
    String caption,
    bool? hasImage,
    String? imageURL,
    bool? hasVideo,
    String? videoURL,
  ) async {
    final payload = {
      'uid': uid,
      'caption': caption,
      'hasImage': hasImage,
      'hasVideo': hasVideo,
      'imageURL': imageURL,
      'videoURL': videoURL,
    };

    return _PostProvider.createPost(payload);
  }
}
