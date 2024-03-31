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
  final dbStories = await db.stories.queryStorys();

  var sharedStories = <Story>[];

  if (dbStories.isNotEmpty) {
    sharedStories = dbStories.map(Story.fromStoryView).toList();
  }

  return Response.json(
    body: {
      'status': 'success',
      'data': sharedStories,
    },
  );
}

Future<Response> _post(
  RequestContext context,
  Map<String, dynamic> body,
) async {
  final database = context.read<Database>();
  final uid = body['uid'] as int;

  final request = db.StoryInsertRequest(
    uid: uid,
    hasImage: body['hasImage'] as bool?,
    imageUrl: body['imageURL'] as String?,
    hasVideo: body['hasVideo'] as bool?,
    videoUrl: body['videoURL'] as String?,
    createdAt: DateTime.now(),
  );

  final storyId = await database.stories.insertOne(request);
  final user = await database.users.queryUser(uid);
  final userRequest = db.UserUpdateRequest(
    id: uid,
    stories: [...user!.stories, storyId],
  );
  await database.users.updateOne(userRequest);

  final dbStory = await database.stories.queryStory(storyId);
  final sharedStory = Story.fromStoryView(dbStory!);

  return Response.json(
    body: {
      'status': 'success',
      'data': sharedStory.toJson(),
    },
  );
}
