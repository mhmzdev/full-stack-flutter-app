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
}
