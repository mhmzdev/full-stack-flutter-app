part of '../button.dart';

_AppButtonModel _danger() {
  return const _AppButtonModel(
    text: {
      AppButtonState.elevated: AppTheme.text,
      AppButtonState.plain: AppTheme.text,
      AppButtonState.disabled: AppTheme.grey,
    },
    backgroundColor: {
      AppButtonState.elevated: AppTheme.danger,
      AppButtonState.plain: AppTheme.danger,
      AppButtonState.disabled: AppTheme.greyDark,
    },
  );
}
