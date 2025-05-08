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
      return _register(context, body);

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

Future<Response> _register(
  RequestContext context,
  Map<String, dynamic> body,
) async {
  final database = context.read<Database>();
  final users = await database.users.queryUsers();

  for (final u in users) {
    if (u.username == body['username'] || u.email == body['email']) {
      return Response.json(
        statusCode: 205,
        body: {
          'status': 'failed',
          'message':
              // ignore: lines_longer_than_80_chars
              'username ${body['username']} or email ${body['email']} is already taken!',
        },
      );
    }
  }

  final hashedPassword = Crypt.sha256(body['password'] as String);

  final request = db.UserInsertRequest(
    firstName: body['firstName'] as String,
    lastName: body['lastName'] as String,
    username: body['username'] as String,
    email: body['email'] as String,
    password: hashedPassword.toString(),
    imageURL: '',
    coverURL: '',
    bio: '',
    followers: [],
    following: [],
    posts: [],
    stories: [],
  );

  final id = await database.users.insertOne(request);

  final sharedUser = User.fromJson({...body, 'id': id});

  return Response.json(
    body: {
      'status': 'success',
      'message': 'User has been added with ID: $id',
      'data': sharedUser.toJson(),
    },
  );
}
