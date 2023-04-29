import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:db/db.dart' as db;

part 'story.freezed.dart';
part 'story.g.dart';

@freezed
class Story with _$Story {
  const factory Story({
    required int id,
    required int uid,
    bool? hasImage,
    @Default('') String imageUrl,
    bool? hasVideo,
    @Default('') String videoUrl,
    required DateTime createdAt,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

  factory Story.fromStoryView(db.StoryView story) => Story(
        id: story.id,
        uid: story.uid,
        imageUrl: story.imageUrl ?? '',
        videoUrl: story.videoUrl ?? '',
        hasImage: story.hasImage,
        hasVideo: story.hasVideo,
        createdAt: story.createdAt,
      );
}
