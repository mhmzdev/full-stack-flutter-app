import 'dart:convert';
import 'dart:io';

import 'package:crypt/crypt.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);

    case HttpMethod.post:
      final request = await context.request.body();
      final map = jsonDecode(request) as Map<String, dynamic>;
      return _post(context, map);

    //
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

Future<Response> _get(RequestContext context) async {
  final db = context.read<Database>();
  final dbUsers = await db.users.queryUsers();

  var sharedUsers = <User>[];

  if (dbUsers.isNotEmpty) {
    sharedUsers = dbUsers.map(User.fromDb).toList();
  }

  return Response.json(
    body: {
      'users': sharedUsers,
    },
  );
}

Future<Response> _post(
  RequestContext context,
  Map<String, dynamic> user,
) async {
  final database = context.read<Database>();

  final users = await database.users.queryUsers();
  for (final u in users) {
    if (u.username == user['username']) {
      return Response.json(
        statusCode: 205,
        body: {
          'status': 'failed',
          'message': 'username ${user['username']} is already taken!',
        },
      );
    }
  }

  final hashedPassword = Crypt.sha256(user['password'] as String);

  final request = db.UserInsertRequest(
    firstName: user['firstName'] as String,
    lastName: user['lastName'] as String,
    username: user['username'] as String,
    email: user['email'] as String,
    password: hashedPassword.toString(),
    imageURL: '',
    coverURL: '',
    bio: '',
    followers: [],
    following: [],
    posts: [],
  );

  final id = await database.users.insertOne(request);

  return Response.json(
    body: {
      'status': 'success',
      'message': 'User has been added with ID: $id',
    },
  );
}
