import 'package:client/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

part '_enums.dart';
part '_model.dart';

part '_data.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.height,
    this.width,
    this.icon,
    this.child,
    this.label,
    this.labelStyle,
    this.iconToEnd = false,
    required this.onPressed,
    this.state = AppButtonState.plain,
    this.style = AppButtonStyle.blue,
    this.radius = AppButtonRadius.medium,
    this.size = AppButtonSize.medium,
    this.mainAxisSize = MainAxisSize.max,
  });

  final double? width;
  final double? height;

  final String? label;
  final TextStyle? labelStyle;

  final IconData? icon;
  final bool iconToEnd;
  final Widget? child;

  final VoidCallback onPressed;
  final MainAxisSize mainAxisSize;

  final AppButtonStyle style;
  final AppButtonState state;
  final AppButtonRadius radius;
  final AppButtonSize size;

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final data = _mapPropsToData()[style]!;
    final borderRadius = _mapRadiusData()[radius];
    final textStyle = _mapSizeToFontSize()[size]!;

    final color = data.backgroundColor[state]!;
    final textColor = data.text[state]!;
    final plain = state == AppButtonState.plain;
    final disabled = state == AppButtonState.disabled;

    final iconSize = .55.un() * textStyle.fontSize!;

    List<BoxShadow> boxShadows = [];
    if (!plain && !disabled) {
      boxShadows = [
        BoxShadow(
          color: color.withValues(alpha: 0.5),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ];
    }

    final smallButton =
        size == AppButtonSize.tiny ||
        size == AppButtonSize.mini ||
        size == AppButtonSize.small;
    final hPadding = smallButton ? Space.v.t20 : Space.v.t30;

    return TouchableOpacity(
      onTap: disabled ? null : onPressed,
      child: AnimatedContainer(
        duration: AppProps.duration,
        padding: Space.h.t30 + hPadding,
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          color: color,
          borderRadius: borderRadius,
          boxShadow: boxShadows,
        ),
        child:
            child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: mainAxisSize,
              children: [
                if (icon != null && !iconToEnd) ...[
                  Icon(icon, size: iconSize, color: textColor),
                  Space.x.t10,
                ],
                if (label != null)
                  Text(
                    label!,
                    style:
                        labelStyle ??
                        AppText.b2.copyWith(fontSize: textStyle.fontSize!) +
                            textColor,
                  ),
                if (icon != null && iconToEnd) ...[
                  Space.x.t10,
                  Icon(icon, size: iconSize, color: textColor),
                ],
              ],
            ),
      ),
    );
  }
}
