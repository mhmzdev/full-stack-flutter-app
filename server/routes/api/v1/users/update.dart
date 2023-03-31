import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.put:
      final request = context.request;
      final map = await request.json() as Map<String, dynamic>;
      return _update(context, map);

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

Future<Response> _update(
  RequestContext context,
  Map<String, dynamic> body,
) async {
  final database = context.read<Database>();

  final dbUser = await database.users.queryUser(body['id'] as int);
  final sharedUserTemp = User.fromDb(dbUser!);
  final email = sharedUserTemp.email;
  final password = sharedUserTemp.password;

  final raw = {
    ...body,
    'email': email,
    'password': password,
  };

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

  final sharedUser = User.fromDb(user);
  print(sharedUser);

  return Response.json(
    body: {
      'status': 'success',
      'message': 'profile has been updated successfully!',
      'data': sharedUser.toJson(),
    },
  );
}
