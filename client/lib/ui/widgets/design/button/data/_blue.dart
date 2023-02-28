part of '../button.dart';

_AppButtonModel _blue() {
  return const _AppButtonModel(
    text: {
      AppButtonState.elevated: AppTheme.text,
      AppButtonState.plain: AppTheme.text,
      AppButtonState.disabled: AppTheme.grey,
    },
    backgroundColor: {
      AppButtonState.elevated: AppTheme.primary,
      AppButtonState.plain: AppTheme.primary,
      AppButtonState.disabled: AppTheme.greyDark,
    },
  );
}
