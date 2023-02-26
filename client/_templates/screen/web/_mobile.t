---
to: lib/ui/screens/<%= h.changeCase.snake(name) %>/views/_mobile.dart
---
part of '../<%= h.changeCase.snake(name) %>.dart';

class _Mobile extends StatelessWidget {
  const _Mobile({Key? key}) : super(key: key);

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
