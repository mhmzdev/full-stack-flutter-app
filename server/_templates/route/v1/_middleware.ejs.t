---
to: routes/api/v1/<%= h.changeCase.snake(name) %>/_middleware.dart
---
import 'package:dart_frog/dart_frog.dart';
import 'package:stormberry/stormberry.dart';
import '../../../_middleware.dart';

Handler middleware(Handler handler) {
  return handler.use(provider<Database>((_) => database));
}
