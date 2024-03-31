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
    return Response.json(
      body: {
        'status': 'failure',
        'message': 'Comment not found',
      },
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
    case HttpMethod.patch:
    case HttpMethod.head:
    case HttpMethod.options:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, db.CommentView dbComment) async {
  final sharedComment = Comment.fromCommentView(dbComment);

  return Response.json(
    body: sharedComment.toJson(),
  );
}

Future<Response> _put(
  RequestContext context,
  int id,
  db.CommentView comment,
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
  final request = context.request;
  final body = await request.json() as Map<String, dynamic>;
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
