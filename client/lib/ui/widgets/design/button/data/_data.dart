part of '../button.dart';

Map<AppButtonStyle, _AppButtonModel> _mapPropsToData() {
  return {
    AppButtonStyle.blue: _blue(),
    AppButtonStyle.white: _white(),
    AppButtonStyle.dark: _dark(),
    AppButtonStyle.ghost: _ghost(),
    AppButtonStyle.danger: _danger(),
  };
}
