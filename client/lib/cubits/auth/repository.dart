part of 'cubit.dart';

class _AuthRepository {
  Future<User?> register(
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
