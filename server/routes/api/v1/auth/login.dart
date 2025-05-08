import 'dart:io';

import 'package:crypt/crypt.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

import '../authenticator.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.post:
      final request = context.request;
      final body = await request.json() as Map<String, dynamic>;
      return _login(context, body);

    //
    case HttpMethod.get:
    case HttpMethod.put:
    case HttpMethod.delete:
    case HttpMethod.patch:
    case HttpMethod.head:
    case HttpMethod.options:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _login(
  RequestContext context,
  Map<String, dynamic> body,
) async {
  db.UserView? user;

  final database = context.read<Database>();
  final users = await database.users.queryUsers();

  for (final u in users) {
    if (u.email == body['email']) {
      user = u;
    }
  }

  if (user == null) {
    return Response.json(
      statusCode: 205,
      body: {
        'status': 'failure',
        'message':
            'Account does not exist for this email address. Please try again!',
      },
    );
  }

  final hashedPassword = user.password;
  final password = body['password'] as String;
  final doMatch = Crypt(hashedPassword).match(password);

  if (!doMatch) {
    return Response.json(
      statusCode: 203,
      body: {
        'status': 'failure',
        'message': 'Email & Password combination do not match. Try again!',
      },
    );
  }

  final authy = context.read<Authenticator>();
  final token = await authy.generateToken(User.fromUserView(user));

  return Response.json(
    body: {
      'status': 'success',
      'token': token,
      'data': User.fromUserView(user).toJson(),
    },
  );
}
