import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context, String stringId) async {
  final id = int.parse(stringId);
  final database = context.read<Database>();
  final dbStory = await database.stories.queryStory(id);

  if (dbStory == null) {
    return Response.json(
      body: {
        'status': 'failure',
        'message': 'Story not found',
      },
      statusCode: HttpStatus.notFound,
    );
  }

  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, dbStory);
    case HttpMethod.delete:
      return _delete(context, id, dbStory);

    //
    case HttpMethod.put:
    case HttpMethod.post:
    case HttpMethod.patch:
    case HttpMethod.head:
    case HttpMethod.options:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, db.StoryView dbStory) async {
  final shareStory = Story.fromStoryView(dbStory);

  return Response.json(
    body: shareStory.toJson(),
  );
}

Future<Response> _delete(
  RequestContext context,
  int id,
  db.StoryView story,
) async {
  final database = context.read<Database>();
  final user = await database.users.queryUser(story.uid);
  user!.stories.remove(id);

  final updateUserReq = db.UserUpdateRequest(
    id: story.uid,
    stories: user.stories,
  );

  await database.stories.deleteOne(id);
  await database.users.updateOne(updateUserReq);

  return Response.json(
    body: {
      'status': 'success',
      'message': 'Story has been deleted successfully!',
    },
  );
}
