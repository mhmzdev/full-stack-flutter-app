import 'package:client/configs/configs.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final Color? color;
  final void Function()? onTap;
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(360),
      onTap: onTap,
      child: Container(
        padding: Space.a.t15,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? AppTheme.backgroundLight,
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
