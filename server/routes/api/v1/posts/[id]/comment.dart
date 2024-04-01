import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context, String postId) async {
  switch (context.request.method) {
    case HttpMethod.put:
      return _put(context);

    //
    case HttpMethod.get:
    case HttpMethod.post:
    case HttpMethod.delete:
    case HttpMethod.patch:
    case HttpMethod.head:
    case HttpMethod.options:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _put(RequestContext context) async {
  final database = context.read<Database>();
  final body = await context.request.json() as Map<String, dynamic>;
  final postId = body['postId'] as int;
  final uid = body['uid'] as int;
  final content = body['content'] as String;

  final comment = db.CommentInsertRequest(
    uid: uid,
    content: content,
    createdAt: DateTime.now(),
  );

  final commentId = await database.comments.insertOne(comment);

  final post = await database.posts.queryPost(postId);
  post!.comments.add(commentId);

  final postUpdate = db.PostUpdateRequest(
    id: postId,
    comments: post.comments,
  );

  await database.posts.updateOne(postUpdate);

  final sharedPost = Post.fromPostView(post);

  return Response.json(
    body: {
      'status': 'success',
      'message': 'Post has been commented!',
      'data': sharedPost.toJson(),
    },
  );
}
