import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:db/db.dart' as db;

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required int id,
    required int uid,
    required String content,
    required DateTime createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  factory Comment.fromCommentView(db.CommentView comment) => Comment(
        id: comment.id,
        uid: comment.uid,
        content: comment.content,
        createdAt: comment.createdAt,
      );
}
