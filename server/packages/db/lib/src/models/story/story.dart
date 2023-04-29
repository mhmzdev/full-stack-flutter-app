import 'package:stormberry/stormberry.dart';

part 'story.schema.dart';

@Model()
abstract class Story {
  @PrimaryKey()
  @AutoIncrement()
  int get id;

  int get uid;
  bool? get hasImage;
  String? get imageUrl;
  bool? get hasVideo;
  String? get videoUrl;

  DateTime get createdAt;
}
