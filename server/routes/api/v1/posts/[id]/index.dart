import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context, String stringId) async {
  final id = int.parse(stringId);
  final database = context.read<Database>();
  final dbPost = await database.posts.queryPost(id);

  if (dbPost == null) {
    return Response.json(
      body: {
        'status': 'failure',
        'message': 'Post not found',
      },
      statusCode: HttpStatus.notFound,
    );
  }

  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, dbPost);
    case HttpMethod.put:
      return _put(context, id, dbPost);
    case HttpMethod.delete:
      return _delete(context, id, dbPost);

    //
    case HttpMethod.post:
    case HttpMethod.patch:
    case HttpMethod.head:
    case HttpMethod.options:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, db.PostView dbPost) async {
  final sharedPost = Post.fromPostView(dbPost);

  return Response.json(
    body: sharedPost.toJson(),
  );
}

Future<Response> _put(RequestContext context, int id, db.PostView post) async {
  final database = context.read<Database>();

  final body = await context.request.json() as Map<String, dynamic>;

  final request = db.PostUpdateRequest(
    id: id,
    caption: body['caption'] as String,
  );

  await database.posts.updateOne(request);

  return Response.json(
    body: {
      'status': 'success',
      'data': 'post has been updated with ID $id',
    },
  );
}

Future<Response> _delete(
  RequestContext context,
  int id,
  db.PostView post,
) async {
  final database = context.read<Database>();
  final user = await database.users.queryUser(post.uid);
  user!.posts.remove(id);

  final updateUserReq = db.UserUpdateRequest(
    id: post.uid,
    posts: user.posts,
  );

  await database.posts.deleteOne(id);
  await database.users.updateOne(updateUserReq);

  return Response.json(
    body: {
      'status': 'success',
      'message': 'Post has been deleted successfully!',
    },
  );
}
