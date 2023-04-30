part of 'cubit.dart';

class _CommentRepository {
  Future<List<Comment>> fetchAll() => _CommentProvider.fetchAll();

  Future<void> delete(int commentId, int postId) {
    final payload = {
      'commentId': commentId,
      'postId': postId,
    };

    return _CommentProvider.deleteComment(payload);
  }
}
