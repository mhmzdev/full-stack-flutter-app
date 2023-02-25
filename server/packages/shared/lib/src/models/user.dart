import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:db/db.dart' as db;

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User implements db.UserView {
  const factory User({
    required int id,
    required String name,
    required String email,
    required List<int> posts,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromDb(db.User user) => User(
        id: user.id,
        name: user.name,
        email: user.email,
        posts: user.posts,
      );
}
