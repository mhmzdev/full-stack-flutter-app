part of '../configs.dart';

class AppScreen {
  static bool xxs = false;
  static bool xs = false;
  static bool sm = false;
  static bool md = false;
  static bool xmd = false;
  static bool lg = false;
  static bool xl = false;
  static bool xlg = false;
  static bool xxlg = false;

  static void init() {
    var width = AppMedia.media().size.width;

    xxs = width > AppBreakpoints.xxs;
    xs = width > AppBreakpoints.xs;
    sm = width > AppBreakpoints.sm;
    md = width > AppBreakpoints.md;
    lg = width > AppBreakpoints.lg;
    lg = width > AppBreakpoints.lg;
    xl = width > AppBreakpoints.xl;
    xlg = width > AppBreakpoints.xlg;
  }
}
