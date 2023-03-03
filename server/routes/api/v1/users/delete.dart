import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.delete:
      final request = context.request;
      final body = await request.json() as Map<String, dynamic>;
      final id = body['id'] as int;

      return _delete(context, id);

    //
    case HttpMethod.get:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.post:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.patch:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.head:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.options:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
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
