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
      return _post(context, map);

    //
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
  final dbComments = await db.comments.queryComments();

  var sharedComments = <Comment>[];

  if (dbComments.isNotEmpty) {
    sharedComments = dbComments.map(Comment.fromCommentView).toList();
  }

  return Response.json(
    body: {
      'status': 'success',
      'data': sharedComments.map((e) => e.toJson()).toList(),
    },
  );
}

Future<Response> _post(
  RequestContext context,
  Map<String, dynamic> comment,
) async {
  final database = context.read<Database>();

  final request = db.CommentInsertRequest(
    uid: comment['uid'] as int,
    content: comment['content'] as String,
    createdAt: DateTime.now(),
  );

  final id = await database.comments.insertOne(request);

  return Response.json(
    body: {
      'status': 'success',
      'message': 'Comment has been added with ID: $id',
    },
  );
}
