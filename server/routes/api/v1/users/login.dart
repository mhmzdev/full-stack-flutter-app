import 'dart:io';

import 'package:crypt/crypt.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.post:
      final request = context.request;
      final body = await request.json() as Map<String, dynamic>;
      return _login(context, body);

    //
    case HttpMethod.get:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.delete:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.patch:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.head:
      return Response(statusCode: HttpStatus.methodNotAllowed);
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

  return Response.json(
    body: {
      'status': 'success',
      'message': '',
      'data': User.fromUserView(user).toJson(),
    },
  );
}
