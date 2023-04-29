import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:db/db.dart' as db;

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User implements db.UserView {
  const factory User({
    required int id,
    required String firstName,
    required String lastName,
    required String username,
    @Default('') String imageURL,
    @Default('') String coverURL,
    required String email,
    required String password,
    String? bio,
    DateTime? birthday,
    @Default([]) List<int> following,
    @Default([]) List<int> followers,
    @Default([]) List<int> posts,
    @Default([]) List<int> stories,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromUserView(db.UserView user) => User(
        id: user.id,
        firstName: user.firstName,
        lastName: user.lastName,
        username: user.username,
        bio: user.bio,
        birthday: user.birthday,
        imageURL: user.imageURL,
        coverURL: user.coverURL,
        email: user.email,
        password: user.password,
        followers: user.followers,
        following: user.following,
        posts: user.posts,
        stories: user.stories,
      );
}
