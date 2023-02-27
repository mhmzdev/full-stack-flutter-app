import 'package:stormberry/stormberry.dart';
part 'comment.schema.dart';

@Model()
abstract class Comment {
  @PrimaryKey()
  @AutoIncrement()
  int get id;

  int get uid;
  String get content;
  DateTime get createdAt;
}
