import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.post:
      final request = context.request;
      final body = await request.json() as Map<String, dynamic>;

      return _post(context, body);

    //
    case HttpMethod.get:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.put:
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

Future<Response> _post(
  RequestContext context,
  Map<String, dynamic> body,
) async {
  final database = context.read<Database>();

  final request = db.PostInsertRequest(
    uid: body['uid'] as int,
    caption: body['caption'] as String,
    hasImage: body['hasImage'] as bool?,
    imageUrl: body['imageURL'] as String?,
    hasVideo: body['hasVideo'] as bool?,
    videoUrl: body['videoURL'] as String?,
    likes: [],
    comments: [],
    createdAt: DateTime.now(),
  );

  final id = await database.posts.insertOne(request);

  final post = {
    ...body,
    'likes': request.likes,
    'comments': request.comments,
    'createdAt': request.createdAt,
  };

  return Response.json(
    body: {
      'status': 'success',
      'message': 'Post has been added with ID: $id',
      'data': post,
    },
  );
}
