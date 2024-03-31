import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);

    //
    case HttpMethod.post:
    case HttpMethod.put:
    case HttpMethod.delete:
    case HttpMethod.patch:
    case HttpMethod.head:
    case HttpMethod.options:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context) async {
  final db = context.read<Database>();
  final dbUsers = await db.users.queryUsers();

  var sharedUsers = <User>[];

  if (dbUsers.isNotEmpty) {
    sharedUsers = dbUsers.map(User.fromUserView).toList();
  }

  return Response.json(
    body: {
      'status': 'success',
      'data': sharedUsers,
    },
  );
}
