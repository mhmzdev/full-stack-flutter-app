part of '../button.dart';

_AppButtonModel _dark() {
  return const _AppButtonModel(
    text: {
      AppButtonState.def: AppTheme.text,
      AppButtonState.plain: AppTheme.text,
      AppButtonState.disabled: AppTheme.grey,
    },
    backgroundColor: {
      AppButtonState.def: AppTheme.backgroundLight,
      AppButtonState.plain: AppTheme.backgroundLight,
      AppButtonState.disabled: AppTheme.greyDark,
    },
  );
}
