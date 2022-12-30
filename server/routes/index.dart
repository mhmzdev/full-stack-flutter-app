// ignore_for_file: lines_longer_than_80_chars

import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  final db = context.read<Database>();
  final dbUser = await db.users.queryUser(1);

  if (dbUser == null) {
    return Response(
      statusCode: 404,
      body: 'User not found!',
    );
  }

  final sharedUser = User.fromDb(dbUser);

  return Response.json(
    body: sharedUser.toJson(),
  );
}
