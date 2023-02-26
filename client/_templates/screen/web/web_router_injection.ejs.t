---
inject: true
to: lib/router/web_router.dart
after: // web-route-start
before: // web-route-ends
skip_if: case AppRoutes.<%= h.changeCase.pascal(name) %>
---
      case AppRoutes.<%= h.changeCase.camel(name) %>:
        return _FadeRoute(
          child: const <%= h.changeCase.pascal(name) %>Screen(),
          settings: settings,
        );