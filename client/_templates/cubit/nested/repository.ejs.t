---
to: lib/cubits/<%= h.changeCase.snake(name) %>/repository.dart
---
part of 'cubit.dart';

class _<%= h.changeCase.pascal(name) %>Repository {
<% args.forEach(function(arg){ %>
  Future< <%= h.changeCase.pascal(arg.model) %>> fetch() => _<%= h.changeCase.pascal(name) %>Provider.fetch();
<% }); %>
}
