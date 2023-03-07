part of 'configs.dart';

abstract class AppProps {
  static final duration = 320.milliseconds;

  static final modalDec = BoxDecoration(
    color: AppTheme.backgroundDark,
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(6.un()),
    ),
  );
}
