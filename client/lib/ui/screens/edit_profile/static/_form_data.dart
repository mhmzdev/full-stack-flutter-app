part of '../edit_profile.dart';

class _FormData {
  static Map<String, dynamic> initialValues(User user) {
    return {
      _FormKeys.firstName: user.firstName,
      _FormKeys.lastName: user.lastName,
      _FormKeys.username: user.username,
      _FormKeys.bio: user.bio,
      _FormKeys.birthday: user.birthday,
    };
  }
}
