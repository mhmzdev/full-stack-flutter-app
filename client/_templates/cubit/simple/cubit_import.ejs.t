---
inject: true
to: lib/main.dart
after: // bloc-imports-start
before: // bloc-imports-end
skip_if: import 'cubits/<%= h.changeCase.snake(name) %>/cubit.dart';
---
import 'cubits/<%= h.changeCase.snake(name) %>/cubit.dart';