part of '../configs.dart';

class SpaceToken {
  static late double t05;
  static late double t10;
  static late double t15;
  static late double t20;
  static late double t25;
  static late double t30;
  static late double t60;
  static late double t100;

  static void init() {
    t05 = 0.5.sp();
    t10 = 1.0.sp();
    t15 = 1.5.sp();
    t20 = 2.0.sp();
    t25 = 2.5.sp();
    t30 = 3.0.sp();
    t60 = 6.0.sp();
    t100 = 10.0.sp();
  }
}
