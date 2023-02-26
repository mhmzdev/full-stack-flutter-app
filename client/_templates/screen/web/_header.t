---
to: lib/ui/screens/<%= h.changeCase.snake(name) %>/widgets/_header.dart
---
part of '../<%= h.changeCase.snake(name) %>.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Custom Widget'),
    );
  }
}