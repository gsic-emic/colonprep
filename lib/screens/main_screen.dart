import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/cards.dart';
import 'package:hospital/models/colonprep_info.dart';
import 'package:hospital/services/cards_manager.dart';
import 'package:hospital/services/local_notification.dart';
import 'package:hospital/services/local_shared_preferences.dart';
import 'package:hospital/widgets/show_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<ColonprepInfo> cpiFuture;
  late Future<Cards> cardsFuture;
  late ColonprepInfo cpi;

  @override
  void initState() {
    super.initState();
    cpiFuture = ColonprepInfo.loadColonprepInfo();
    cardsFuture = cpiFuture.then((cpi) => CardsManager.createCards(cpi)).then((_) => Cards.loadCards());
    loadColonprepInfo();
  }

  loadColonprepInfo() async {
    cpi = await ColonprepInfo.loadColonprepInfo();
  }

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ColonPrep'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: ancho * 0.04),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.format_align_justify_rounded, color: Colors.blue),
                    title: Text('Modificar Formulario'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.history_rounded, color: Colors.blue),
                    title: Text('Historial'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.cancel_outlined, color: Colors.blue),
                    title: const Text('Cancelar preparación'),
                    onTap: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Text('Confirmación'),
                            content: const Text('Una vez cancelada la preparación, perderá todo el progreso'),
                            actions: [

                              CupertinoDialogAction(
                                child: const Text('Retroceder'),
                                onPressed: () => Navigator.pop(context)
                              ),

                              CupertinoDialogAction(
                                child: const Text('Cancelar'),
                                onPressed: () {
                                  //Se pone una 
                                  // LocalSharedPreferences.prefs.setBool('createdColonprepInfo', false);
                                  LocalNotification().cancelNotifications();
                                  ColonprepInfo.removeColonprepInfo();
                                  Cards.removeCards();
                                  Navigator.pushNamedAndRemoveUntil(context, 'initialscreen', (route) => false);
                                },
                              ),

                            ],
                          );
                        }
                      );
                      
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: alto * 0.03)),
                  const Text('- Versión 1.0.0 -'),
                ],
              ),
            )
          ],
        )
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
                  
                  ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                      maximumSize: MaterialStateProperty.all(Size(ancho * 0.8, double.infinity)),
                      minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                      backgroundColor: MaterialStateProperty.all(Colors.lightBlue.shade400),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.white, width: 2)
                        )
                      )
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'adddefecationscreen', arguments: cpi);
                      setState(() {});
                    },
                    child: const Text("Añadir deposición", textScaleFactor: 1.2),
                  ),
                  
                  Padding(padding: EdgeInsets.only(top: alto * 0.03)),
                  
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {

                        //Solo muestra las tarjetas que no están ocultas o de tipo WARNING
                        if(cards.cards![index].state == 'Hidden' || cards.cards![index].type != 'Warning') {
                          return Container();
                        } else {
                          return Column(
                            children: [
                              ShowCard(
                                cards.cards![index],
                                ancho: ancho,
                                alto: alto,
                              ),
                              Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                            ],
                          );
                        }

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