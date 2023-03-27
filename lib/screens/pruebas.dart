import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/providers/appointments_provider.dart';
import 'package:hospital/services/local_shared_preferences.dart';

class Pruebas extends StatefulWidget {
  const Pruebas({super.key});

  @override
  State<Pruebas> createState() => _PruebasState();
}

class _PruebasState extends State<Pruebas> {

  @override
  Widget build(BuildContext context) {

    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
        child: Column(
          children: [

            Padding(padding: EdgeInsets.only(top: alto * 0.1)),

            const Text(
              "PRUEBAS",
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            ElevatedButton(
              onPressed: () {
                AppointmentsProvider.createAppointment(DateTime.parse(LocalSharedPreferences.prefs.getString('date')!));

              },
              child: const Text("Crear cita"),
            ),

            ElevatedButton(
              onPressed: () {
                AppointmentsProvider.getAppointment();
                
              },
              child: const Text("Obtener cita"),
            ),

            ElevatedButton(
              onPressed: () {
                AppointmentsProvider.updateAppointment();
                
              },
              child: const Text("Actualizar cita"),
            ),

            ElevatedButton(
              onPressed: () {
                AppointmentsProvider.changeQuestionnaireValue(AppointmentsProvider.weight, LocalSharedPreferences.prefs.getInt('weight') as int);
                AppointmentsProvider.changeQuestionnaireValue(AppointmentsProvider.height, LocalSharedPreferences.prefs.getInt('height') as int);
                
              },
              child: const Text("Actualizar peso y altura"),
            ),

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

                Padding(padding: EdgeInsets.only(left: ancho * 0.05)),

                Expanded(
                  child: CupertinoButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, 'questionsscreen');
                    },
                    color: Colors.green,
                    padding:
                        EdgeInsets.only(top: alto * 0.015, bottom: alto * 0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Continuar", textScaleFactor: 1.2),
                        Padding(padding: EdgeInsets.only(left: ancho * 0.02)),
                        const Icon(Icons.arrow_forward),
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
