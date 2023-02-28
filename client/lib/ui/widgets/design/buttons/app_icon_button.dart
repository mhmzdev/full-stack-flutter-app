import 'package:client/configs/configs.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final void Function() onTap;
  final Widget icon;
  const AppIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: Space.a.t15,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.backgroundLight,
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
