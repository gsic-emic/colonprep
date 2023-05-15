import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotification {
  LocalNotification();

  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();
  
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
      onDidReceiveNotificationResponse: (details) {
        print('notificacion');
      },
      
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
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await notificationsPlugin.show(0, title, body, notificationDetails, payload: payload);
  }

  Future<void> scheduledNotificationShow(String title, String subtitleDarwin, String body, DateTime dateTime) async {
    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
      'Channel_id',
      'Channel_title',
      priority: Priority.high,
      importance: Importance.max,
      channelShowBadge: false,
    );
    DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
      subtitle: subtitleDarwin,
    );
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails, iOS: darwinNotificationDetails);
    try {
      await notificationsPlugin.zonedSchedule(
        0,
        title,
        body,
        payload: '',
        // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        tz.TZDateTime.from(dateTime, tz.local),
        notificationDetails,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
      );
    } on ArgumentError {
      print('Se ha programado una notificación para un momento pasado');
    }
  }

  Future<List<PendingNotificationRequest>> pendingNotifications() {
    return notificationsPlugin.pendingNotificationRequests();
  }

  void cancelNotifications() {
    notificationsPlugin.cancelAll();
  }
}