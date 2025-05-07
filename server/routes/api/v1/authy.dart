import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';

import '_middleware.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.post:
    case HttpMethod.get:
    case HttpMethod.put:
    case HttpMethod.delete:
    case HttpMethod.patch:
    case HttpMethod.head:
    case HttpMethod.options:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

class Authy {
  static const String jwtSecret =
      // ignore: lines_longer_than_80_chars
      'JWT SECRET AUTH KEY, I AM SORRY IF THIS GOT HACKED.NOT A PRO BACKEND DEVELOPER XD';

  Future<User?> verifyToken(String? token) async {
    if (token == null) {
      return null;
    }

    final users = await database.users.queryUsers();

    final jwtKey = SecretKey(jwtSecret);
    final jwt = JWT.verify(token, jwtKey);

    final payload = jwt.payload as Map<String, dynamic>;

    for (final u in users) {
      if (u.id == (payload['uid'] as int)) {
        return User.fromUserView(u);
      }
    }

    return null;
  }

  Future<String> generateToken(User user) async {
    final jwt = JWT({'uid': user.id, 'username': user.username});

    final token = jwt.sign(SecretKey(jwtSecret));
    return token;
  }
}
