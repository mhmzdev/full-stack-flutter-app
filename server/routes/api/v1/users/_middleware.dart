import 'package:dart_frog/dart_frog.dart';
import 'package:stormberry/stormberry.dart';

final database = Database(
  host: 'localhost',
  port: 5432,
  database: 'postgres',
  user: 'postgres',
  password: 'changeme', // pull this from secret keys (cloud or .env)
  useSSL: false,
  isUnixSocket: false,
);

Handler middleware(Handler handler) {
  return handler.use(provider<Database>((_) => database));
}
