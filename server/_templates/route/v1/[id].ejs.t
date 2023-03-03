---
to: "<%= dynamic ? `routes/api/v1/${h.changeCase.snake(name)}/[id].dart` : null %>"
---
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context, int id) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, id);
    case HttpMethod.put:
      return _put(context, id);
    case HttpMethod.delete:
      return _delete(context, id);
    
    // 
    case HttpMethod.post:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.patch:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.head:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.options:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, int id) async {
  return Response.json(
    body: 'Something GET at $id',
  );
}

Future<Response> _put(RequestContext context, int id) async {
  return Response.json(
    body: 'Something Updated at $id',
  );
}

Future<Response> _delete(RequestContext context, int id) async {
  return Response.json(
    body: 'Something Deleted at $id',
  );
}
