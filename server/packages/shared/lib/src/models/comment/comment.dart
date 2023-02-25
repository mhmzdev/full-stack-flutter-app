import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:db/db.dart' as db;

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required int id,
    required String content,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  factory Comment.fromDb(db.Comment comment) =>
      Comment(id: comment.id, content: comment.content);
}
