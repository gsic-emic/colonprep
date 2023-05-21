import 'package:flutter/material.dart';
import 'package:hospital/models/cards.dart';
import 'package:hospital/models/colonprep_info.dart';
import 'package:hospital/services/cards_manager.dart';
import 'package:hospital/services/local_notification.dart';
import 'package:hospital/tools/tools.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<ColonprepInfo> cpiFuture;
  late Future<Cards> cardsFuture;

  @override
  void initState() {
    super.initState();
    cpiFuture = ColonprepInfo.loadColonprepInfo();
    cardsFuture = cpiFuture.then((cpi) => CardsManager.createCards(cpi)).then((_) => Cards.loadCards());
  }

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;

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
                ColonprepInfo.removeColonprepInfo();
                Navigator.pushNamedAndRemoveUntil(context, 'initialscreen', (route) => false);
                print('hola');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ancho * 0.02),
            child: GestureDetector(
              child: const CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Text('AL', style: TextStyle(color: Colors.white)),
              ),
              onTap: () {
                setState(() {
                  cardsFuture = cpiFuture.then((cpi) => CardsManager.createCards(cpi)).then((_) => Cards.loadCards());
                });
              },
            ),
          ),
        ],
      ),
      body: FutureBuilder<Cards>(
        future: cardsFuture,
        builder: (BuildContext context, AsyncSnapshot<Cards> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Muestra un indicador de progreso mientras se carga la información
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar las tarjetas')); // Muestra un mensaje de error si ocurre algún problema
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No hay datos disponibles')); // Muestra un mensaje si no hay datos disponibles
          } else {
            final cards = snapshot.data!;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: alto * 0.03)),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Tarjeta(
                              cards.cards![index].timestamp!,
                              cards.cards![index].text!,
                              cards.cards![index].type!,
                              cards.cards![index].description,
                              ancho: ancho,
                              alto: alto,
                            ),
                            Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                          ],
                        );
                      },
                      itemCount: cards.cards?.length,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}


class Tarjeta extends StatelessWidget {
  const Tarjeta(this.datetime, this.text, this.type, this.description,  {
    super.key,
    required this.ancho,
    required this.alto,
  });

  final DateTime datetime;
  final String text;
  final String type;
  final String? description;
  final double ancho;
  final double alto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ancho * 0.95,
      padding: EdgeInsets.only(top: alto * 0.01, bottom: alto * 0.01, left: ancho * 0.04, right: ancho * 0.04),
      decoration: BoxDecoration(
        border: Border.all(
          color: (type == 'Info') ? Colors.blueGrey : Colors.greenAccent,
          style: BorderStyle.solid,
          width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            Tools.formatDateWithoutTime(datetime),
            textAlign: TextAlign.justify,
            style: const TextStyle(
                color: Colors.white),
          ),
          Padding(padding: EdgeInsets.only(top: alto * 0.01)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Tools.formatTimeWithoutDate(datetime),
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
              (type == 'Info') ? const Icon(Icons.info_outline_rounded) : const Icon(Icons.check_rounded),
            ],
          ),
        ],
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