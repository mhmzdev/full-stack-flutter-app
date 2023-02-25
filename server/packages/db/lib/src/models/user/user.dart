import 'package:stormberry/stormberry.dart';
part 'user.schema.dart';

@Model()
abstract class User {
  @PrimaryKey()
  @AutoIncrement()
  int get id;

  String get name;
  String get email;
  List<int> get posts;
}
