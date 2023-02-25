import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context, int id) async {
  final database = context.read<Database>();
  final dbPost = await database.posts.queryPost(id);

  if (dbPost == null) {
    return Response(
      body: 'Post not found',
      statusCode: HttpStatus.notFound,
    );
  }

  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, dbPost);
    case HttpMethod.put:
      return _put(context, id, dbPost);
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

Future<Response> _get(RequestContext context, db.Post? dbPost) async {
  if (dbPost == null) {
    return Response(
      statusCode: 404,
      body: 'Post not found!',
    );
  }

  final sharedPost = Post.fromDb(dbPost);

  return Response.json(
    body: sharedPost.toJson(),
  );
}

Future<Response> _put(RequestContext context, int id, db.Post post) async {
  final database = context.read<Database>();

  final postToBeUpdated =
      Post.fromJson(await context.request.json() as Map<String, dynamic>);

  final request = db.PostUpdateRequest(
    id: id,
    uid: postToBeUpdated.uid,
    likes: postToBeUpdated.likes,
    videoUrl: postToBeUpdated.videoUrl,
    hasVideo: postToBeUpdated.hasVideo,
    imageUrl: postToBeUpdated.imageUrl,
    hasImage: postToBeUpdated.hasImage,
    caption: postToBeUpdated.caption,
    createdAt: postToBeUpdated.createdAt,
  );

  await database.posts.updateOne(request);

  return Response.json(
    body: postToBeUpdated.toJson(),
  );
}

Future<Response> _delete(RequestContext context, int id) async {
  final database = context.read<Database>();
  await database.posts.deleteOne(id);

  return Response(
    statusCode: HttpStatus.noContent,
  );
}
