import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.put:
      final request = context.request;
      final body = await request.json() as Map<String, dynamic>;
      return _updatePhoto(context, body);

    case HttpMethod.get:
    case HttpMethod.post:
    case HttpMethod.delete:
    case HttpMethod.patch:
    case HttpMethod.head:
    case HttpMethod.options:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _updatePhoto(
  RequestContext context,
  Map<String, dynamic> body,
) async {
  final database = context.read<Database>();
  final id = body['uid'] as int;
  final url = body['url'] as String;
  final isProfilePhoto = body['isProfilePhoto'] as bool;

  final oldUser = await database.users.queryUser(id);

  final request = db.UserUpdateRequest(
    id: id,
    imageURL: isProfilePhoto ? url : oldUser?.imageURL,
    coverURL: !isProfilePhoto ? url : oldUser?.coverURL,
  );

  await database.users.updateOne(request);
  final user = await database.users.queryUser(id);
  final sharedUser = User.fromUserView(user!);

  return Response.json(
    body: {
      'status': 'success',
      'message': 'Photo has been updated successfully!',
      'data': sharedUser.toJson(),
    },
  );
}
