part of 'cubit.dart';

class _AuthRepository {
  Future<User> fetch(int uid) {
    final payload = {
      'uid': uid,
    };

    return _AuthProvider.fetch(payload);
  }

  Future<User> login(String email, String password) {
    final payload = {
      'email': email,
      'password': password,
    };

    return _AuthProvider.login(payload);
  }

  Future<User> register(
    String firstName,
    String lastName,
    String username,
    String email,
    String password,
  ) {
    final payload = {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'password': password,
    };

    return _AuthProvider.register(payload);
  }

  Future<User> update(
    int uid,
    String firstName,
    String lastName,
    String username,
    String newUserName,
    String bio,
    DateTime birthday,
  ) {
    final payload = {
      'id': uid,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'newUserName': newUserName,
      'bio': bio,
      'birthday': DateFormat('yyyy-MM-dd HH:MM').format(birthday),
    };

    return _AuthProvider.update(payload);
  }

  Future<User> updatePhoto(
    int uid,
    String url,
    bool isProfilePhoto,
  ) {
    final payload = {
      'uid': uid,
      'url': url,
      'isProfilePhoto': isProfilePhoto,
    };

    return _AuthProvider.updatePicture(payload);
  }

  Future<String> uploadMedia(
    User profile,
    File? file,
    PictureType type,
  ) =>
      _AuthProvider.uploadMedia(
        profile,
        file,
        type: type,
      );
}
