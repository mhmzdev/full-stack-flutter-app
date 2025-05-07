import 'package:alice/alice.dart';
import 'package:alice/core/alice_dio_interceptor.dart';
import 'package:flutter/material.dart';

class AppAlice {
  static late Alice ins;

  static void init() {
    ins = Alice(
      showNotification: true,
      notificationIcon: '@drawable/ic_notify',
    );
  }

  static void setNavigatorKey(GlobalKey<NavigatorState> key) {
    ins.setNavigatorKey(key);
  }

  static AliceDioInterceptor getDioInterceptor() {
    return ins.getDioInterceptor();
  }

  static void showInspector() {
    ins.showInspector();
  }
}
