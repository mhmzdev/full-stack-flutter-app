---
to: routes/api/v1/<%= h.changeCase.snake(name) %>/index.dart
---
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);
    case HttpMethod.post:
      return _post(context);

    // 
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

Future<Response> _get(RequestContext context) async {
  return Response.json(
    body: {
      'get': 'this is GET method request',
    },
  );
}

Future<Response> _post(RequestContext context) async {
  return Response.json(
    body: {
      'post': 'This is POST method request',
    },
  );
}
