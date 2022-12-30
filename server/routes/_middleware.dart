import 'package:dart_frog/dart_frog.dart';
import 'package:stormberry/stormberry.dart';

/*
NOTE: This won't be readable while migration in stormberry, so requires
ENV variables

-> DB_SSL=false DB_SOCKET=false DB_NAME=postgres <migration command>

*/

final db = Database(
  host: 'localhost',
  port: 5432,
  database: 'postgres',
  user: 'postgres',
  password: 'changeme', // pull this from secret keys (cloud or .env)
  useSSL: false,
  isUnixSocket: false,
);

Handler middleware(Handler handler) {
  return handler.use(provider<Database>((_) => db));
}
