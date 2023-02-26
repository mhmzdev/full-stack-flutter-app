part of '../configs.dart';

class SpaceToken {
  static late double s05;
  static late double s10;
  static late double s15;
  static late double s20;
  static late double s25;
  static late double s30;
  static late double s60;
  static late double s100;

  static void init() {
    s05 = 0.5.sp();
    s10 = 1.0.sp();
    s15 = 1.5.sp();
    s20 = 2.0.sp();
    s25 = 2.5.sp();
    s30 = 3.0.sp();
    s60 = 6.0.sp();
    s100 = 10.0.sp();
  }
}
