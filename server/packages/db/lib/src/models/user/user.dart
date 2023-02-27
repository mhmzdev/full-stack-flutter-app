import 'package:stormberry/stormberry.dart';
part 'user.schema.dart';

@Model()
abstract class User {
  @PrimaryKey()
  @AutoIncrement()
  int get id;

  String get firstName;
  String get lastName;
  String get username;
  String get email;
  String get bio;
  String get imageURL;
  String get coverURL;
  List<int> get followers;
  List<int> get following;
  List<int> get posts;
}
