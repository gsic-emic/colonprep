import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotification {
  LocalNotification();

  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    DarwinInitializationSettings initializationIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );
    InitializationSettings initializationSettings = InitializationSettings(
      iOS: initializationIOS
    );
    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
  }

  Future<void> simpleNotificationShow(String title, String body, String payload) async {
    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
      'Channel_id',
      'Channel_title',
      priority: Priority.high,
      importance: Importance.max,
      channelShowBadge: false,
    );
    DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
      subtitle: "¿Ha recordado tomar Evacuol?",
    );
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails, iOS: darwinNotificationDetails);
    await notificationsPlugin.show(0, title, body, notificationDetails, payload: payload);
  }

  Future<void> scheduledNotificationShow(String title, String body, String payload) async {
    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
      'Channel_id',
      'Channel_title',
      priority: Priority.high,
      importance: Importance.max,
      channelShowBadge: false,
    );
    DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
      subtitle: "¿Ha recordado tomar Evacuol?",
    );
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails, iOS: darwinNotificationDetails);
    await notificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      payload: payload,
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      notificationDetails,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }
}