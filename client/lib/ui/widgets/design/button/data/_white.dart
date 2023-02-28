part of '../button.dart';

_AppButtonModel _white() {
  return const _AppButtonModel(
    text: {
      AppButtonState.elevated: Colors.black,
      AppButtonState.plain: Colors.black,
      AppButtonState.disabled: AppTheme.grey,
    },
    backgroundColor: {
      AppButtonState.elevated: Colors.white,
      AppButtonState.plain: Colors.white,
      AppButtonState.disabled: AppTheme.greyDark,
    },
  );
}
