import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.post:
      return _post(context);

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

Future<Response> _post(RequestContext context) async {
  final database = context.read<Database>();
  final body = await context.request.json() as Map<String, dynamic>;
  final currentUserId = body['uid'] as int;
  final userTobeFollowedId = body['userToBeFollowedId'] as int;
  final removeFollower = body['removeFollower'] as bool;

  final users = await database.users.queryUsers(
    QueryParams(
      where: 'id = $currentUserId or id = $userTobeFollowedId',
    ),
  );
  final currentUser =
      users.firstWhere((element) => element.id == currentUserId);
  if (!removeFollower) {
    if (currentUser.following.contains(userTobeFollowedId)) {
      currentUser.following.remove(userTobeFollowedId);
    } else {
      currentUser.following.add(userTobeFollowedId);
    }
  } else {
    if (currentUser.followers.contains(userTobeFollowedId)) {
      currentUser.followers.remove(userTobeFollowedId);
    } else {
      currentUser.followers.add(userTobeFollowedId);
    }
  }

  final userToBeFollowed =
      users.firstWhere((element) => element.id == userTobeFollowedId);

  if (!removeFollower) {
    if (userToBeFollowed.followers.contains(currentUserId)) {
      userToBeFollowed.followers.remove(currentUserId);
    } else {
      userToBeFollowed.followers.add(currentUserId);
    }
  } else {
    if (userToBeFollowed.following.contains(currentUserId)) {
      userToBeFollowed.following.remove(currentUserId);
    } else {
      userToBeFollowed.following.add(currentUserId);
    }
  }

  final currentUserUpdated = db.UserUpdateRequest(
    id: currentUserId,
    following: currentUser.following,
    followers: currentUser.followers,
  );

  final userToBeFollowedUpdated = db.UserUpdateRequest(
    id: userTobeFollowedId,
    followers: userToBeFollowed.followers,
    following: userToBeFollowed.following,
  );

  await database.users
      .updateMany([currentUserUpdated, userToBeFollowedUpdated]);

  return Response.json(
    body: {
      'status': 'success',
      'message': 'Action successful!',
    },
  );
}
