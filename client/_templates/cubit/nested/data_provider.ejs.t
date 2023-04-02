---
to: lib/cubits/<%= h.changeCase.snake(name) %>/data_provider.dart
---
part of 'cubit.dart';

class _<%= h.changeCase.pascal(name) %>Provider {
<% args.forEach(function(arg){ %>
  static Future< <%= h.changeCase.pascal(arg.model) %>> <%= h.changeCase.camel(arg.module) %>() async {
    try {
      final Map<String, dynamic> raw = {};
      return <%= h.changeCase.pascal(arg.model) %>.fromJson(raw);
    } catch (e) {
      debugPrint('------ <%= h.changeCase.pascal(name) %>Provider ------');
      debugPrint('------ $e ------');
      throw Exception("Internal server error. Please try again!");
    }
  }
<% }); %>
}
