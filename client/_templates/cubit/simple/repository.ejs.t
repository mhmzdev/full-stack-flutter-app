---
to: lib/cubits/<%= h.changeCase.snake(name) %>/repository.dart
---
part of 'cubit.dart';

class _<%= h.changeCase.pascal(name) %>Repository {
  Future< <%= h.changeCase.pascal(model) %>> fetch() => _<%= h.changeCase.pascal(name) %>Provider.fetch();
}
