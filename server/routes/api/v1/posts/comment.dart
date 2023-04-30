import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.put:
      return _put(context);

    //
    case HttpMethod.get:
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

Future<Response> _put(RequestContext context) async {
  final db = context.read<Database>();
  final body = await context.request.json() as Map<String, dynamic>;
  final postId = body['postId'] as int;
  final uid = body['uid'] as int;
  final content = body['content'] as String;

  final comment = CommentInsertRequest(
    uid: uid,
    content: content,
    createdAt: DateTime.now(),
  );

  final commentId = await db.comments.insertOne(comment);

  final post = await db.posts.queryPost(postId);

  final postUpdate = PostUpdateRequest(
    id: postId,
    comments: [...post!.comments, commentId],
  );

  await db.posts.updateOne(postUpdate);

  return Response.json(
    body: {
      'status': 'success',
      'message': 'Post has been commented!',
    },
  );
}
