import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.delete:
      return _delete(context);

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

Future<Response> _delete(RequestContext context) async {
  final request = context.request;
  final body = await request.json() as Map<String, dynamic>;
  final id = body['commentId'] as int;
  final postId = body['postId'] as int;

  final database = context.read<Database>();
  final comment = await database.comments.queryComment(id);
  if (comment == null) {
    return Response.json(
      statusCode: 204,
      body: {
        'status': 'failure',
        'message': 'No comment found!',
      },
    );
  }
  await database.comments.deleteOne(id);

  final post = await database.posts.queryPost(postId);
  if (post == null) {
    return Response.json(
      statusCode: 204,
      body: {
        'status': 'failure',
        'message': 'No post found!',
      },
    );
  }

  post.comments.remove(id);

  final updatedPost = db.PostUpdateRequest(
    id: postId,
    comments: post.comments,
  );

  await database.posts.updateOne(updatedPost);

  return Response.json(
    body: {
      'status': 'success',
      'message': 'Comment has been delete successfully!',
    },
  );
}
