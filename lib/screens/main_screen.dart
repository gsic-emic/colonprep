import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';
import 'package:hospital/services/local_notification.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {

    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;

    ColonprepInfo cpi = ModalRoute.of(context)!.settings.arguments as ColonprepInfo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ColonPrep'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ancho * 0.02),
            child: GestureDetector(
              child: const CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Text('AF', style: TextStyle(color: Colors.white)),
              ),
              onTap: () {
                LocalNotification().cancelNotifications();
                print('hola');
              },
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        
            Padding(padding: EdgeInsets.only(top: alto * 0.03)),
        
            // Text(
            //   "Quedan $diasRestantes días para la cita",
            //   textAlign: TextAlign.left,
            //   textScaleFactor: 1.3,
            //   style: const TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold),
            // ),
        
            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            Expanded(
              child: ListView(
                children: [
                  TarjetaVerde('Recuerda suspender la toma de hierro 5 días antes de la prueba', '16:00', ancho: ancho, alto: alto),
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                  TarjetaRoja('No ha confirmado la segunda dosis de Pleinvue', '15:00', ancho: ancho, alto: alto),
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                  TarjetaVerde('Ha confirmado la primera dosis de Pleinvue', '14:00', ancho: ancho, alto: alto),
                ],
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}

class TarjetaVerde extends StatelessWidget {
  const TarjetaVerde(this.text,
    this.hour, {
    super.key,
    required this.ancho,
    required this.alto,
  });

  final String text;
  final String hour;
  final double ancho;
  final double alto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ancho * 0.95,
      padding: EdgeInsets.only(top: alto * 0.01, bottom: alto * 0.01, left: ancho * 0.04, right: ancho * 0.04),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.greenAccent,
          style: BorderStyle.solid,
          width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hour,
            textAlign: TextAlign.justify,
            style: const TextStyle(
                color: Colors.white),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: ancho * 0.01)),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                  color: Colors.white),
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: ancho * 0.01)),
          const Icon(Icons.check_rounded),
        ],
      ),
    );
  }
}

class TarjetaRoja extends StatelessWidget {
  const TarjetaRoja(this.text, 
    this.hour, {
    super.key,
    required this.ancho,
    required this.alto,
  });

  final String text;
  final String hour;
  final double ancho;
  final double alto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ancho * 0.95,
      padding: EdgeInsets.only(top: alto * 0.01, bottom: alto * 0.01, left: ancho * 0.04, right: ancho * 0.04),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.redAccent,
          style: BorderStyle.solid,
          width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hour,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    color: Colors.white),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: ancho * 0.01)),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      color: Colors.white),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: ancho * 0.01)),
              const Icon(Icons.dangerous_rounded),
            ],
          ),
          TextButton(
            onPressed: (){},
            child: const Text(
              'Confirmar toma',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            )
          ),
        ],
      ),
    );
  }
}