part of '../button.dart';

_AppButtonModel _ghost() {
  return const _AppButtonModel(
    text: {
      AppButtonState.elevated: AppTheme.text,
      AppButtonState.plain: AppTheme.text,
      AppButtonState.disabled: AppTheme.grey,
    },
    backgroundColor: {
      AppButtonState.elevated: Colors.transparent,
      AppButtonState.plain: Colors.transparent,
      AppButtonState.disabled: AppTheme.greyDark,
    },
  );
}
