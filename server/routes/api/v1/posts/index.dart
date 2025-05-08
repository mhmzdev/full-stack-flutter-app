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
  final dbPosts = await db.posts.queryPosts();

  var sharedPosts = <Post>[];

  if (dbPosts.isNotEmpty) {
    sharedPosts = dbPosts.map(Post.fromPostView).toList();
  }

  return Response.json(body: {'status': 'success', 'data': sharedPosts});
}

Future<Response> _post(
  RequestContext context,
  Map<String, dynamic> body,
) async {
  final database = context.read<Database>();
  final uid = body['uid'] as int;

  final request = db.PostInsertRequest(
    uid: uid,
    caption: body['caption'] as String,
    hasImage: body['hasImage'] as bool?,
    imageUrl: body['imageURL'] as String?,
    hasVideo: body['hasVideo'] as bool?,
    videoUrl: body['videoURL'] as String?,
    likes: [],
    comments: [],
    createdAt: DateTime.now(),
  );

  final postId = await database.posts.insertOne(request);
  final user = await database.users.queryUser(uid);
  final userRequest = db.UserUpdateRequest(
    id: uid,
    posts: [...user!.posts, postId],
  );
  await database.users.updateOne(userRequest);

  final dbPost = await database.posts.queryPost(postId);
  final sharedPost = Post.fromPostView(dbPost!);

  return Response.json(
    body: {'status': 'success', 'data': sharedPost.toJson()},
  );
}
