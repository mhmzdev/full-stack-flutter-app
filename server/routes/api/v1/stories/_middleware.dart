import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_auth/dart_frog_auth.dart';
import 'package:stormberry/stormberry.dart';

import '../_middleware.dart';
import '../authenticator.dart';

Handler middleware(Handler handler) {
  final authy = Authenticator(database: database);
  return handler
      .use(
        provider<Database>((context) {
          return database;
        }),
      )
      .use(
        bearerAuthentication<bool>(
          authenticator: (context, token) {
            return authy.verifyToken(token);
          },
        ),
      );
}
