part of 'cubit.dart';

class _AuthRepository {
  Future<User> fetch(int uid) {
    final payload = {
      'uid': uid,
    };

    return _AuthProvider.fetch(payload);
  }

  Future<List<User>> fetchAll() => _AuthProvider.fetchAll();

  Future<UserResponse> login(String email, String password) {
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
    DateTime? birthday,
  ) {
    final payload = {
      'id': uid,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'newUserName': newUserName,
      'bio': bio,
      if (birthday != null)
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

  Future<void> follow(
    int uid,
    int userToBeFollowedId,
    bool removeFollower,
  ) {
    final payload = {
      'uid': uid,
      'userToBeFollowedId': userToBeFollowedId,
      'removeFollower': removeFollower,
    };

    return _AuthProvider.follow(payload);
  }
}
