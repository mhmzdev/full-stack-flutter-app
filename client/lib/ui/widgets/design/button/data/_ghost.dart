part of '../button.dart';

_AppButtonModel _ghost() {
  return const _AppButtonModel(
    text: {
      AppButtonState.def: AppTheme.text,
      AppButtonState.plain: AppTheme.text,
      AppButtonState.disabled: AppTheme.grey,
    },
    backgroundColor: {
      AppButtonState.def: AppTheme.backgroundDark,
      AppButtonState.plain: AppTheme.backgroundDark,
      AppButtonState.disabled: AppTheme.greyDark,
    },
  );
}
