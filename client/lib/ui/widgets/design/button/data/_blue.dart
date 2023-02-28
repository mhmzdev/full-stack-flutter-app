part of '../button.dart';

_AppButtonModel _blue() {
  return const _AppButtonModel(
    text: {
      AppButtonState.def: AppTheme.text,
      AppButtonState.plain: AppTheme.text,
      AppButtonState.disabled: AppTheme.grey,
    },
    backgroundColor: {
      AppButtonState.def: AppTheme.primary,
      AppButtonState.plain: AppTheme.primary,
      AppButtonState.disabled: AppTheme.greyDark,
    },
  );
}
