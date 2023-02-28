import 'package:client/configs/configs.dart';
import 'package:flutter/material.dart';

part '_enums.dart';
part '_model.dart';

part 'data/_blue.dart';
part 'data/_danger.dart';
part 'data/_dark.dart';
part 'data/_data.dart';
part 'data/_ghost.dart';
part 'data/_white.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.height,
    this.width,
    this.icon,
    this.child,
    this.label,
    this.iconToEnd = false,
    required this.onPressed,
    this.state = AppButtonState.plain,
    this.style = AppButtonStyle.blue,
  });

  final double? width;
  final double? height;

  final String? label;
  final IconData? icon;
  final bool iconToEnd;
  final Widget? child;

  final VoidCallback onPressed;

  final AppButtonStyle style;
  final AppButtonState state;

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final data = _mapPropsToData()[style]!;
    final color = data.backgroundColor[state]!;
    final textColor = data.text[state]!;
    final plain = state == AppButtonState.plain;
    final disabled = state == AppButtonState.disabled;

    final iconSize = 12.un();

    return SizedBox(
      height: height ?? 22.un(),
      width: width ?? double.infinity,
      child: InkWell(
        onTap: disabled ? null : onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: (plain || disabled)
                ? []
                : [
                    BoxShadow(
                      color: color == Colors.white
                          ? Colors.black.withOpacity(0.1)
                          : color.withOpacity(0.5),
                      blurRadius: 8,
                      offset: const Offset(0, 8),
                    ),
                  ],
          ),
          child: Center(
            child: (child != null && label == null)
                ? child
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (icon != null && !iconToEnd) ...[
                        Icon(
                          icon,
                          size: iconSize,
                          color: textColor,
                        ),
                        Space.x.t10,
                      ],
                      Text(
                        label!,
                        style: AppText.b1 + textColor,
                      ),
                      if (icon != null && iconToEnd) ...[
                        Space.x.t10,
                        Icon(
                          icon,
                          size: iconSize,
                          color: textColor,
                        ),
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
