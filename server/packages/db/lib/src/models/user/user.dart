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
  String get password;
  String? get bio;
  DateTime? get birthday;
  String get imageURL;
  String get coverURL;
  List<int> get followers;
  List<int> get following;
  List<int> get posts;
  List<int> get stories;
}
