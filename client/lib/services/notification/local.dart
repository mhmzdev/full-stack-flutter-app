part of 'notification.dart';

class LocalNotification {
  static late GlobalKey<NavigatorState> _navigator;
  static final ins = FlutterLocalNotificationsPlugin();

  static void init(GlobalKey<NavigatorState> state) async {
    _navigator = state;
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@drawable/ic_notify'),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
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
      final hasAndroidPermission =
          await LocalNotification.ins
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >()
              ?.requestNotificationsPermission();
      AppLog.log(
        '--- Android 13 and above has notification permission ----- $hasAndroidPermission',
      );
    }
  }

  static Future<void> handleNotificationAction(
    Map<String, dynamic> payload,
  ) async {
    if (payload.isNotEmpty) {
      // final String type = payload['type'] ?? '';
      // final sessionId = payload['sessionId'] as String?;

      // if (type == NotifyType.session.name) {
      //   Navigator.pushNamedAndRemoveUntil(
      //     _navigator.currentContext!,
      //     AppRoutes.sessionDetails,
      //     arguments: {'sessionId': sessionId},
      //     (route) => false,
      //   );

      //   return;
      // }
      // Navigator.pushNamedAndRemoveUntil(
      //   _navigator.currentContext!,
      //   AppRoutes.appNotifications,
      //   (route) => false,
      // );
    } else {
      AppAlice.showInspector();
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
          styleInformation: BigTextStyleInformation(notification.body ?? ''),
        ),
        iOS: const DarwinNotificationDetails(presentSound: true),
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
