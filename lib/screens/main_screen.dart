import 'package:flutter/material.dart';
import 'package:hospital/models/cards.dart';
import 'package:hospital/models/colonprep_info.dart';
import 'package:hospital/services/cards_manager.dart';
import 'package:hospital/services/local_notification.dart';
import 'package:hospital/widgets/show_card.dart';

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
                            ShowCard(
                              cards.cards?[index].timestamp,
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