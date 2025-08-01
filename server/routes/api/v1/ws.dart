import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

import 'authenticator.dart';

final _clients = <String, WebSocketChannel>{};

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) async {
    final uri = context.request.uri;
    final token = uri.queryParameters['token'];

    if (token == null) {
      channel.sink.add('Unauthorized');
      return;
    }

    final verified = await context.read<Authenticator>().verifyToken(token);

    if (verified == -1) {
      channel.sink.add('Invalid token');
      return;
    }

    final userId = verified;
    _clients[token] = channel;

    channel.stream.listen(
      (data) {
        try {
          final json = data as Map<String, dynamic>;
          final toUserId = json['to'];
          final message = json['message'];

          final outgoing = jsonEncode({'from': userId, 'message': message});

          _clients[toUserId]?.sink.add(outgoing);
        } catch (e) {
          print('❌ Error parsing message: $e');
        }
      },
      onDone: () {
        print('🔌 Disconnected: $userId');
        _clients.remove(userId);
      },
    );
  });

  return handler(context);
}
