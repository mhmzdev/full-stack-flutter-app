import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context, String stringId) async {
  final id = int.parse(stringId);
  final database = context.read<Database>();
  final dbComment = await database.comments.queryComment(id);

  if (dbComment == null) {
    return Response(
      body: 'Comment not found',
      statusCode: HttpStatus.notFound,
    );
  }

  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, dbComment);
    case HttpMethod.put:
      return _put(context, id, dbComment);
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

Future<Response> _get(RequestContext context, db.Comment? dbComment) async {
  if (dbComment == null) {
    return Response(
      statusCode: 404,
      body: 'Comment not found!',
    );
  }

  final sharedComment = Comment.fromDb(dbComment);

  return Response.json(
    body: sharedComment.toJson(),
  );
}

Future<Response> _put(
  RequestContext context,
  int id,
  db.Comment comment,
) async {
  final database = context.read<Database>();

  final commentToBeUpdated =
      Comment.fromJson(await context.request.json() as Map<String, dynamic>);

  final request = db.CommentUpdateRequest(
    id: id,
    uid: commentToBeUpdated.uid,
    content: commentToBeUpdated.content,
  );

  await database.comments.updateOne(request);

  return Response.json(
    body: commentToBeUpdated.toJson(),
  );
}

Future<Response> _delete(RequestContext context, int id) async {
  final database = context.read<Database>();
  await database.comments.deleteOne(id);

  return Response(
    statusCode: HttpStatus.noContent,
  );
}
