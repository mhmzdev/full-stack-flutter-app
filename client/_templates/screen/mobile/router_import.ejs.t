---
inject: true
to: lib/router/router.dart
after: // imports
skip_if: import 'package:client/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart';
---
import 'package:client/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart';