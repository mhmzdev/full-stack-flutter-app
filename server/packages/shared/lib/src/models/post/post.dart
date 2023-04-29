import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:db/db.dart' as db;

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required int id,
    required int uid,
    required String caption,
    bool? hasImage,
    @Default('') String imageUrl,
    bool? hasVideo,
    @Default('') String videoUrl,
    @Default([]) List<int> likes,
    @Default([]) List<int> comments,
    required DateTime createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromPostView(db.PostView post) => Post(
        id: post.id,
        uid: post.uid,
        caption: post.caption,
        likes: post.likes,
        imageUrl: post.imageUrl ?? '',
        videoUrl: post.videoUrl ?? '',
        hasImage: post.hasImage,
        hasVideo: post.hasVideo,
        comments: post.comments,
        createdAt: post.createdAt,
      );
}
