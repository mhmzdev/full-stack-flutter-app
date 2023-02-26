---
inject: true
to: lib/router/routes.dart
after: class AppRoutes {
skip_if: static const <%= h.changeCase.camel(name) %> = '/<%= h.changeCase.param(name) %>';
---
static const <%= h.changeCase.camel(name) %> = '/<%= h.changeCase.param(name) %>';