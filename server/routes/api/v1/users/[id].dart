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
      body: {
        'status': 'failure',
        'message': 'User not found',
      },
      statusCode: HttpStatus.notFound,
    );
  }

  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, dbUser);

    //
    case HttpMethod.put:
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

Future<Response> _get(RequestContext context, db.User? dbUser) async {
  if (dbUser == null) {
    return Response.json(
      statusCode: 404,
      body: {
        'status': 'failure',
        'message': 'User not found!',
      },
    );
  }

  final sharedUser = User.fromDb(dbUser);

  return Response.json(
    body: {
      'status': 'success',
      'message': 'User found',
      'data': sharedUser.toJson(),
    },
  );
}
