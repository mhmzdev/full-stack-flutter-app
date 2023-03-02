import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.put:
      final request = await context.request.body();
      final map = jsonDecode(request) as Map<String, dynamic>;
      final user = User.fromJson(map);
      return _update(context, user);

    //
    case HttpMethod.get:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.post:
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

Future<Response> _update(RequestContext context, User user) async {
  final database = context.read<Database>();
  final users = await database.users.queryUsers();
  for (final u in users) {
    if (u.id != user.id && u.username == user.username) {
      return Response.json(
        statusCode: 203,
        body: {
          'status': 'failure',
          'message': 'username ${user.username} is already taken!',
        },
      );
    }
  }

  final request = db.UserUpdateRequest(
    id: user.id,
    firstName: user.firstName,
    lastName: user.lastName,
    username: user.username,
    imageURL: user.imageURL,
    coverURL: user.coverURL,
    birthday: user.birthday,
    bio: user.bio,
  );

  await database.users.updateOne(request);

  final sharedUser = User.fromDb(user);

  return Response.json(
    body: {
      'status': 'success',
      'message': 'Profile has been updated successfully!',
      'data': sharedUser.toJson(),
    },
  );
}
