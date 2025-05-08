import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context, String stringId) async {
  final id = int.parse(stringId);
  final database = context.read<Database>();
  final dbUser = await database.users.queryUser(id);

  if (dbUser == null) {
    return Response.json(
      statusCode: 205,
      body: {
        'status': 'failure',
        'message': 'User not found or account has been disabled. Try again!',
      },
    );
  }

  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, dbUser);

    case HttpMethod.put:
      final request = context.request;
      final body = await request.json() as Map<String, dynamic>;
      return _update(context, body);

    case HttpMethod.delete:
      final request = context.request;
      final body = await request.json() as Map<String, dynamic>;
      final id = body['id'] as int;
      return _delete(context, id);

    //
    case HttpMethod.patch:
    case HttpMethod.post:
    case HttpMethod.head:
    case HttpMethod.options:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, db.UserView dbUser) async {
  final sharedUser = User.fromUserView(dbUser);

  return Response.json(
    body: {
      'status': 'success',
      'message': 'User found',
      'data': sharedUser.toJson(),
    },
  );
}

Future<Response> _update(
  RequestContext context,
  Map<String, dynamic> body,
) async {
  final database = context.read<Database>();

  final dbUser = await database.users.queryUser(body['id'] as int);
  final sharedUserTemp = User.fromUserView(dbUser!);
  final email = sharedUserTemp.email;
  final password = sharedUserTemp.password;

  final raw = {...body, 'email': email, 'password': password};

  final user = User.fromJson(raw);
  final newUserName = body['newUserName'] as String;

  if (newUserName != user.username) {
    final users = await database.users.queryUsers();

    for (final u in users) {
      if (u.username == newUserName) {
        return Response.json(
          statusCode: 203,
          body: {
            'status': 'failure',
            'message': 'username $newUserName is already taken. Try again!',
          },
        );
      }
    }
  }

  final request = db.UserUpdateRequest(
    id: user.id,
    firstName: user.firstName,
    lastName: user.lastName,
    username: newUserName,
    birthday: user.birthday,
    bio: user.bio,
  );

  await database.users.updateOne(request);
  final updatedUser = await database.users.queryUser(user.id);
  final sharedUser = User.fromUserView(updatedUser!);

  return Response.json(
    body: {
      'status': 'success',
      'message': 'profile has been updated successfully!',
      'data': sharedUser.toJson(),
    },
  );
}

Future<Response> _delete(RequestContext context, int id) async {
  final database = context.read<Database>();
  await database.users.deleteOne(id);

  return Response.json(
    body: {
      'status': 'success',
      'message': 'Profile has been deleted successfully!',
    },
  );
}
