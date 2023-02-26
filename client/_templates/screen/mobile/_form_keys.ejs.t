---
to: "<%= formData ? `lib/ui/screens/${h.changeCase.snake(name)}/static/_form_keys.dart` : null %>"
---
part of '../<%= h.changeCase.snake(name) %>.dart';

class _FormKeys {
  static const email = "email";
}