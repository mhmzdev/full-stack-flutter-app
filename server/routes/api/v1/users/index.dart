import 'dart:async';
import 'dart:convert';
import 'dart:io';

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
      final user = User.fromJson(map);

      return _post(context, user);

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

Future<Response> _post(RequestContext context, User user) async {
  final database = context.read<Database>();

  final request = db.UserInsertRequest(
    name: user.name,
    email: user.email,
  );
  final id = await database.users.insertOne(request);

  return Response.json(
    body: {
      'user': 'User has been added with ID: $id',
    },
  );
}
