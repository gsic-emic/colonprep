import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/services/preparation.dart';

class Pruebas extends StatefulWidget {
  const Pruebas({super.key});

  @override
  State<Pruebas> createState() => _PruebasState();
}

class _PruebasState extends State<Pruebas> {

  @override
  void initState() {
    Preparation.initPrep();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(padding: EdgeInsets.only(top: alto * 0.1)),

            const Text(
              "Aquí comienza tu preparación",
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            // ElevatedButton(
            //   onPressed: () {
            //     LocalNotification().scheduledNotificationShow('Notificacion1', 'Tome el preparado', 'noti1');

            //   },
            //   child: const Text("Noti 5 seg"),
            // ),

          ],
        ),
      ),

      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [

            Row(
              children: [

                Expanded(
                  child: CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.red,
                    padding:
                        EdgeInsets.only(top: alto * 0.015, bottom: alto * 0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.arrow_back),
                        Padding(padding: EdgeInsets.only(left: ancho * 0.02)),
                        const Text("Retroceder", textScaleFactor: 1.2),
                      ],
                    ),
                  ),
                ),

              ],
            ),

            Padding(padding: EdgeInsets.only(bottom: alto * 0.05)),

          ],
        ),
      ),
    );
  }
}
