part of '../configs.dart';

class AppUnit {
  static double padding = 0.0;
  static double ratio = 0.0;

  static void init() {
    ratio = AppMedia.width / AppMedia.height;
    double pixelDensity = AppMedia.media().devicePixelRatio;
    ratio = (ratio) + ((pixelDensity + ratio) / 2);

    if (AppMedia.width <= 380 && pixelDensity >= 3) {
      ratio *= 0.85;
    }

    _initLargeScreens();
    _initSmallScreensHighDensity();

    padding = ratio * 3;
  }

  static void _initLargeScreens() {
    const safe = 2.4;

    ratio *= 1.5;

    if (ratio > safe) {
      ratio = safe;
    }
  }

  static void _initSmallScreensHighDensity() {
    if (!AppScreen.sm && ratio > 2.0) {
      ratio = 2.0;
    }
    if (!AppScreen.xs && ratio > 1.6) {
      ratio = 1.6;
    }
    if (!AppScreen.xxs && ratio > 1.4) {
      ratio = 1.4;
    }
  }

  static double sp([num multiplier = 1.0]) {
    return AppUnit.padding * 1 * multiplier;
  }

  static double un(num unit) {
    return (AppUnit.ratio * unit * 0.77) + unit;
  }

  static double font(num unit) {
    return (AppUnit.ratio * unit * 0.125) + (unit * 2.0);
  }
}
