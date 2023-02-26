---
to: lib/ui/screens/<%= h.changeCase.snake(name) %>/views/_tablet.dart
---
part of '../<%= h.changeCase.snake(name) %>.dart';

class _Tablet extends StatelessWidget {
  const _Tablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
     <% if (formData) { %>
    final screenState = _ScreenState.s(context, true);
     <% } %>

    return Screen(
      keyboardHandler: true,
      <% if (formData) { %>
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(),
      <% } %>
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            _Header(),
          ],
        ),
      ),
    );
  }
}
