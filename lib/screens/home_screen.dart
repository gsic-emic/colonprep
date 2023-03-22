import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hospital/services/local_notification_service.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      //   title: const Text("Página de inicio"),
      // ),

      body: Center(
        child: CupertinoButton.filled(
          onPressed: () async {
            await service.showNotification(id: 0, title: 'ColonPrep', body: '¡AVISO! Recuerde tomar 2 litros de agua');
          }, 
          child: const Text("Notificación local"),
        ),
      ),

    );
  }
}