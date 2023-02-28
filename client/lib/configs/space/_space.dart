// ignore_for_file: library_private_types_in_public_api

part of '../configs.dart';

class Space {
  static late _SpaceModelWidget x;
  static late _SpaceModelWidget y;
  static late Widget ym;
  static late Widget xm;

  static late _SpaceModelEdgeInsets a;
  static late _SpaceModelEdgeInsets h;
  static late _SpaceModelEdgeInsets v;
  static late _SpaceModelEdgeInsets t;
  static late _SpaceModelEdgeInsets r;
  static late _SpaceModelEdgeInsets b;
  static late _SpaceModelEdgeInsets l;
  static const EdgeInsets z = EdgeInsets.zero;

  static late Widget top;
  static late Widget bottom;

  static void init() {
    SpaceToken.init();

    x = _x();
    y = _y();

    ym = const Expanded(child: SizedBox(height: double.infinity));
    xm = const Expanded(child: SizedBox(width: double.infinity));

    a = _a();
    h = _h();
    v = _v();
    t = _t();
    r = _r();
    b = _b();
    l = _l();

    top = SizedBox(height: AppMedia.padding.top);
    bottom = SizedBox(height: AppMedia.padding.bottom);
  }

  static Widget yf(double y) => SizedBox(height: y.sp());
  static Widget xf(double x) => SizedBox(width: x.sp());

  static EdgeInsets sym([double? h, double? v]) {
    final u = SpaceToken.t15;
    return EdgeInsets.symmetric(
      vertical: v ?? u,
      horizontal: h ?? u,
    );
  }

  static EdgeInsets only([double? t, double? r, double? b, double? l]) {
    const u = 0.0;
    return EdgeInsets.only(
      top: t ?? u,
      right: r ?? u,
      bottom: b ?? u,
      left: l ?? u,
    );
  }
}
