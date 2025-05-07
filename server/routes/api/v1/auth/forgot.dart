import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.post:
      final req = await context.request.body();
      final map = jsonDecode(req) as Map<String, dynamic>;
      return _forgotPassword(context, map['email'] as String);

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

Future<Response> _forgotPassword(RequestContext context, String email) async {
  final database = context.read<Database>();
  final param = QueryParams(
    where: 'email',
    values: {
      'email': email,
    },
  );
  final users = await database.users.queryUsers(param);
  if (users.isEmpty) {
    return Response.json(
      statusCode: 205,
      body: {
        'status': 'failure',
        'message': 'Email not found. Please try again!',
      },
    );
  }

  // TODO(mhmzdev): Sent reset link to email,
  return Response.json(
    body: {
      'status': 'failure',
      'message': 'Please follow the instructions sent at your email $email',
    },
  );
}
