import 'dart:convert';
import 'dart:io';

import 'package:client/services/alice.dart';
import 'package:client/services/log.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

part 'configs.dart';
part 'local.dart';

Future<void> _onBackgroundMessageHandler(RemoteMessage message) async {
  // print("Handling a background message: ${message.notification?.title}");
}

class AppFCM {
  static late GlobalKey<NavigatorState> _navigator;
  static final ins = FirebaseMessaging.instance;

  static void init(GlobalKey<NavigatorState> state) async {
    _navigator = state;
    LocalNotification.init(_navigator);
    await _requestPermission();
    await AppFCM.ins.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessageHandler);
    AppLog.log('Notifications initialized');
  }

  static void onReceiveRemoteMessage() async {
    debugPrint('----- Notification listener -----');
    _handleForeground();
    _handleBackground();
  }

  static void _handleForeground() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotification.showNotification(message);
      final context = _navigator.currentContext;
      if (context != null && context.mounted) {
        // NotifyCubit.c(context).updateUnreadNotification(true);
      }
    });
  }

  static void _handleBackground() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      LocalNotification.handleNotificationAction(message.data);
    });
  }

  static Future<String?> updateFCM(String? deviceToken) async {
    try {
      String? token;
      if (Platform.isIOS) {
        token = await ins.getAPNSToken();
      } else {
        token = await ins.getToken();
      }
      if (token == deviceToken) return null;
      return token;
    } catch (e) {
      AppLog.log('Error updating FCM: $e');
      return null;
    }
  }

  static Future<NotificationSettings> _requestPermission() async {
    final settings = await ins.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    return settings;
  }

  static Future<NotificationSettings> getNotificationSettings() async {
    return await ins.getNotificationSettings();
  }
}
