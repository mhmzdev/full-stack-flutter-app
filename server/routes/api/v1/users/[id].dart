import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context, int id) async {
  final database = context.read<Database>();
  final dbUser = await database.users.queryUser(id);

  if (dbUser == null) {
    return Response(
      body: 'User not found',
      statusCode: HttpStatus.notFound,
    );
  }

  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, dbUser);
    case HttpMethod.put:
      return _put(context, id, dbUser);
    case HttpMethod.delete:
      return _delete(context, id);

    //
    case HttpMethod.post:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.patch:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.head:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.options:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, db.User? dbUser) async {
  if (dbUser == null) {
    return Response(
      statusCode: 404,
      body: 'User not found!',
    );
  }

  final sharedUser = User.fromDb(dbUser);

  return Response.json(
    body: sharedUser.toJson(),
  );
}

Future<Response> _put(RequestContext context, int id, db.User user) async {
  final database = context.read<Database>();

  final userToBeUpdated =
      User.fromJson(await context.request.json() as Map<String, dynamic>);

  final request = db.UserUpdateRequest(
    id: id,
    email: userToBeUpdated.email,
    name: userToBeUpdated.name,
  );

  await database.users.updateOne(request);

  final sharedUser = User.fromDb(userToBeUpdated);

  return Response.json(
    body: sharedUser.toJson(),
  );
}

Future<Response> _delete(RequestContext context, int id) async {
  final database = context.read<Database>();
  await database.users.deleteOne(id);

  return Response(
    statusCode: HttpStatus.noContent,
  );
}
