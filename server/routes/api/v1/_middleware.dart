import 'package:dart_frog/dart_frog.dart';
import 'package:stormberry/stormberry.dart';

/*
NOTE: This won't be readable while migration in stormberry, so requires
ENV variables

-> DB_SSL=false DB_SOCKET=false DB_NAME=postgres <migration command>

*/

final database = Database(
  host: 'localhost',
  port: 5432,
  database: 'postgres',
  user: 'postgres',
  password: 'changeme', // pull this from secret keys (cloud or .env)
  useSSL: false,
  isUnixSocket: false,
);

Future<Response?> auth(RequestContext context) async {
  // final env = DotEnv()..load();

  final headers = context.request.headers;
  final auth = headers['Authorization'];
  final token = auth?.split(' ').last;

  if (token == null) {
    return Response.json(
      statusCode: 401,
      body: {
        'message': 'NOT Authorized!',
      },
    );
  }

  // final secretKey = env['JWT_SECRET']!;
  // final jwt = JWT.verify(token, SecretKey(secretKey));
  return null;

  // if TOKEN is invalid
}

Handler middleware(Handler handler) {
  return handler.use(
    provider<Database>((RequestContext context) {
      return database;
    }),
  );
}
