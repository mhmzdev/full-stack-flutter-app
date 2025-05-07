import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_auth/dart_frog_auth.dart';
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

import 'authy.dart';

/*
NOTE: This won't be readable while migration in stormberry, so requires
ENV variables

-> DB_SSL=false DB_SOCKET=false DB_NAME=postgres <migration command>

*/

final database = Database(
  host: 'localhost',
  port: 5432,
  database: 'postgres',
  username: 'postgres',
  password: 'changeme', // pull this from secret keys (cloud or .env)
  useSSL: false,
  isUnixSocket: false,
);

Handler middleware(Handler handler) {
  return handler.use(
    provider<Database>((context) {
      return database;
    }),
  ).use(
    bearerAuthentication<User>(
      authenticator: (context, token) async {
        final authy = context.read<Authy>();
        return authy.verifyToken(token);
      },
    ),
  );
}
