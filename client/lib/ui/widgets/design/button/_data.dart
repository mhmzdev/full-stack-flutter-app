part of 'button.dart';

Map<AppButtonStyle, _AppButtonModel> _mapPropsToData() {
  return {
    AppButtonStyle.blue: const _AppButtonModel(
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
    ),
    AppButtonStyle.white: const _AppButtonModel(
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
    ),
    AppButtonStyle.dark: const _AppButtonModel(
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
    ),
    AppButtonStyle.ghost: const _AppButtonModel(
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
    ),
    AppButtonStyle.danger: const _AppButtonModel(
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
    ),
  };
}

Map<AppButtonRadius, BorderRadius> _mapRadiusData() {
  return {
    AppButtonRadius.less: 8.radius(),
    AppButtonRadius.medium: 10.radius(),
    AppButtonRadius.round: 18.radius(),
    AppButtonRadius.capsule: 30.radius(),
  };
}

Map<AppButtonSize, TextStyle> _mapSizeToFontSize() {
  return {
    AppButtonSize.large: AppText.b1.removeHeight(),
    AppButtonSize.medium: AppText.b2.removeHeight(),
    AppButtonSize.small: AppText.b3.removeHeight(),
    AppButtonSize.mini: AppText.s1.removeHeight(),
    AppButtonSize.tiny: AppText.s2.removeHeight(),
  };
}
