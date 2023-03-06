---
to: lib/cubits/<%= h.changeCase.snake(name) %>/repository.dart
---
part of 'cubit.dart';

class _<%= h.changeCase.pascal(name) %>Repository {
<% args.forEach(function(arg){ %>
  Future< <%= h.changeCase.pascal(arg.model) %>> <%= h.changeCase.camel(arg.module) %>() => _<%= h.changeCase.pascal(name) %>Provider.<%= h.changeCase.camel(arg.module) %>();
<% }); %>
}
