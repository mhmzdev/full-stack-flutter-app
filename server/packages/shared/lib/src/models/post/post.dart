import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required int id,
    required int uid,
    required String caption,
    @Default(false) bool hasImage,
    @Default('') String imageUrl,
    @Default(false) bool hasVideo,
    @Default('') String videoUrl,
    @Default([]) List<int> likes,
    @Default([]) List<Comment> comments,
    required DateTime createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromDb(db.Post post) => Post(
        id: post.id,
        uid: post.uid,
        caption: post.caption,
        likes: post.likes,
        comments: post.comments.map(Comment.fromDb).toList(),
        createdAt: post.createdAt,
      );
}
