part of '../inbox.dart';

class _MessageInput extends StatelessWidget {
  const _MessageInput();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);

    return FormBuilderTextField(
      name: _FormKeys.message,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      maxLines: null,
      onChanged: (value) {
        if (value != null) {
          state.onMessageChange(value);
        }
      },
      decoration: InputDecoration(
        contentPadding: Space.h.t30 + Space.v.t20,
        hintText: 'Type message...',
        filled: true,
        fillColor: AppTheme.backgroundLight,
        enabledBorder: OutlineInputBorder(
          borderRadius: 12.radius(),
          borderSide: const BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: 12.radius(),
          borderSide: BorderSide(
            color: AppTheme.primary,
            width: 1.un(),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: 12.radius(),
          borderSide: BorderSide(
            color: Colors.red.withAlpha(200),
            width: 1.un(),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: 12.radius(),
          borderSide: BorderSide(
            color: Colors.red.withAlpha(200),
            width: 1.un(),
          ),
        ),
      ),
    );
  }
}
