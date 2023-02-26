---
inject: true
to: lib/main.dart
after: // bloc-initiate-start
before: // bloc-initiate-end
skip_if: "BlocProvider[(]create: [(]_[)] => <%= h.changeCase.pascal(name) %>Cubit[())]"
---
        BlocProvider(create: (_) => <%= h.changeCase.pascal(name) %>Cubit()),
