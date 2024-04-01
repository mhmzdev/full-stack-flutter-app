part of 'notification.dart';

class LocalNotification {
  static final ins = FlutterLocalNotificationsPlugin();

  static void init() async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@drawable/ic_nofitication'),
      iOS: DarwinInitializationSettings(
        onDidReceiveLocalNotification:
            LocalNotification.onDidReceiveLocalNotification,
      ),
    );

    await LocalNotification.ins.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        if (details.id == 0) {
          AppAlice.showInspector();
        }
      },
    );

    if (Platform.isAndroid) {
      final hasAndroidPermission = await LocalNotification.ins
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
      debugPrint(
          '--- Android 13 and above has notification permission ----- $hasAndroidPermission');
    }
  }

  static Future handleNotificationAction(Map<String, dynamic> payload) async {
    if (payload.isNotEmpty) {
      // do something
    } else {
      return AppAlice.showInspector();
    }
  }

  static Future<void> showNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;
    await LocalNotification.ins.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          methodChannel.id,
          methodChannel.name,
          channelDescription: methodChannel.description,
          priority: Priority.high,
          importance: Importance.max,
          playSound: true,
        ),
        iOS: const DarwinNotificationDetails(
          presentSound: true,
        ),
      ),
      payload: jsonEncode(message.data),
    );
  }

  static Future<void> onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {
    //
  }
}
