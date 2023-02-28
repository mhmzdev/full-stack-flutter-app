part of '../button.dart';

_AppButtonModel _dark() {
  return const _AppButtonModel(
    text: {
      AppButtonState.elevated: AppTheme.text,
      AppButtonState.plain: AppTheme.text,
      AppButtonState.disabled: AppTheme.grey,
    },
    backgroundColor: {
      AppButtonState.elevated: AppTheme.backgroundLight,
      AppButtonState.plain: AppTheme.backgroundLight,
      AppButtonState.disabled: AppTheme.greyDark,
    },
  );
}
