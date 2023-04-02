part of 'cubit.dart';

class _PostRepository {
  Future<List<Post>> fetchAll() => _PostProvider.fetchAll();

  Future<Post> createPost(
    int uid,
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

  Future<void> editPost(int postId, String caption) async {
    final payload = {
      'id': postId,
      'caption': caption,
    };

    return _PostProvider.editPost(payload);
  }

  Future<void> deletePost(int postId, String imageUrl) {
    final payload = {
      'postId': postId,
      'imageURL': imageUrl,
    };

    return _PostProvider.deletePost(payload);
  }
}
