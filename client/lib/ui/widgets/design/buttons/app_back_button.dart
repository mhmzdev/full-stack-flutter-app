import 'package:client/configs/configs.dart';
import 'package:client/ui/painter/base.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final void Function()? onTap;
  const AppBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(360),
      onTap: onTap ?? () => ''.pop(context),
      child: Container(
        padding: Space.a.t15,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.backgroundLight,
        ),
        child: Center(
          child: CustomPaint(
            painter: const ArrowLeftIconPainter(
              color: AppTheme.grey,
            ),
            size: ArrowLeftIconPainter.s(12.un()),
          ),
        ),
      ),
    );
  }
}
