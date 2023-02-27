import 'package:stormberry/stormberry.dart';
part 'post.schema.dart';

@Model()
abstract class Post {
  @PrimaryKey()
  @AutoIncrement()
  int get id;

  int get uid;
  String get caption;
  bool? get hasImage;
  String? get imageUrl;
  bool? get hasVideo;
  String? get videoUrl;
  List<int> get likes;
  List<int> get comments;

  DateTime get createdAt;
}
