import 'dart:convert';
import 'dart:io';

import 'package:client/services/alice.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

part 'local.dart';
part 'configs.dart';

Future<void> _onBackgroundMessageHandler(RemoteMessage message) async {
  // print("Handling a background message: ${message.notification?.title}");
}

class AppFCM {
  static final ins = FirebaseMessaging.instance;

  static void init(GlobalKey<NavigatorState> state) async {
    LocalNotification.init();
    await _requestPermission();
    await ins.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessageHandler);
  }

  static Future<String?> getToken() {
    return ins.getToken();
  }

  static void refreshFCM(String uid) {
    ins.onTokenRefresh.listen((token) {
      updateUserFCM(token, uid);
    }, onError: ((err) {
      debugPrint('---- FCM Listener Error -----');
      debugPrint('---- $err -----');
    }));
  }

  static void updateUserFCM(String? token, String uid) async {
    // if (token == null) return;

    // final ref =
    //     FirebaseFirestore.instance.collection(Collections.users).doc(uid);

    // final doc = await ref.get();
    // if (doc.exists) {
    //   await ref.update(
    //     {'deviceToken': token},
    //   );
    // }
  }

  static void onReceiveRemoteMessage() async {
    debugPrint('----- Notification listener -----');
    _handleForeground();
    _handleBackground();
    _handleTerminated();
  }

  static void _handleForeground() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      LocalNotification.showNotification(message);
    });
  }

  static void _handleBackground() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      LocalNotification.handleNotificationAction(message.data);
    });
  }

  static void _handleTerminated() async {
    final message = await AppFCM.ins.getInitialMessage();
    if (message == null) return;

    LocalNotification.handleNotificationAction(message.data);
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
}
