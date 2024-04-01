import 'dart:ui' as ui;
import 'package:client/configs/configs.dart';
import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  final bool loading;
  final Color? color;
  const FullScreenLoader({
    super.key,
    this.loading = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (!loading) {
      return const SizedBox.shrink();
    }
    return AbsorbPointer(
      absorbing: loading,
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: SizedBox(
          width: AppMedia.width,
          height: AppMedia.height,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color?>(color),
            ),
          ),
        ),
      ),
    );
  }
}
