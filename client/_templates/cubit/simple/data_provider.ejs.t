---
to: lib/cubits/<%= h.changeCase.snake(name) %>/data_provider.dart
---
<% pmodel = h.changeCase.pascal(model) %>
part of 'cubit.dart';

class _<%= h.changeCase.pascal(name) %>Provider {
  static Future< <%= pmodel %>> fetch() async {
    try {
      final Map<String, dynamic> raw = {};
      return <%= pmodel %>.fromMap(raw);
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}
