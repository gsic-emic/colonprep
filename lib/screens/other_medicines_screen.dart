import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class OtherMedicinesScreen extends StatefulWidget {
  const OtherMedicinesScreen({super.key});

  @override
  State<OtherMedicinesScreen> createState() => _OtherMedicinesScreenState();
}

class _OtherMedicinesScreenState extends State<OtherMedicinesScreen> {

  void botonPulsado(ColonprepInfo cpi, String medicamento) {
    if(cpi.patientQuestionnaire!.medicines!.contains(medicamento)) {
      cpi.patientQuestionnaire!.medicines!.remove(medicamento);
    } else {
      cpi.patientQuestionnaire!.medicines!.add(medicamento);
    }
  }

  @override
  Widget build(BuildContext context) {

    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;

    ColonprepInfo cpi = ModalRoute.of(context)!.settings.arguments as ColonprepInfo;
    cpi.patientQuestionnaire?.medicines ??= [];

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
        child: Column(
          children: [

            Padding(padding: EdgeInsets.only(top: alto * 0.1)),

            const Text(
              "MEDICACIÓN",
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            Image.asset(
              "assets/images/medicine.png",
              width: double.infinity,
              height: ancho * 0.3,
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            const Text(
              "¿Toma alguno de los siguientes fármacos? Marque todos los que tome:",
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            CheckboxListTile(
              title: ElevatedButton(
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                  backgroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Hierro')) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                  foregroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Hierro')) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.white, width: 2)
                    )
                  )
                ),
                onPressed: () {
                  botonPulsado(cpi, 'Hierro');
                  setState(() {});
                },
                child: const Text("Hierro", textAlign: TextAlign.center),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.white,
              checkColor: Colors.lightBlue.shade400,
              value: cpi.patientQuestionnaire!.medicines!.contains('Hierro'),
              onChanged: (value) {
                botonPulsado(cpi, 'Hierro');
                setState(() {});
              },
            ),

            CheckboxListTile(
              title: ElevatedButton(
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                  backgroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Anticoagulantes orales')) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                  foregroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Anticoagulantes orales')) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.white, width: 2)
                    )
                  )
                ),
                onPressed: () {
                  botonPulsado(cpi, 'Anticoagulantes orales');
                  setState(() {});
                },
                child: const Text("Anticoagulantes orales", textAlign: TextAlign.center),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.white,
              checkColor: Colors.lightBlue.shade400,
              value: cpi.patientQuestionnaire!.medicines!.contains('Anticoagulantes orales'),
              onChanged: (value) {
                botonPulsado(cpi, 'Anticoagulantes orales');
                setState(() {});
              },
            ),

            CheckboxListTile(
              title: ElevatedButton(
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                  backgroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Antiagregantes')) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                  foregroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Antiagregantes')) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.white, width: 2)
                    )
                  )
                ),
                onPressed: () {
                  botonPulsado(cpi, 'Antiagregantes');
                  setState(() {});
                },
                child: const Text("Antiagregantes", textAlign: TextAlign.center),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.white,
              checkColor: Colors.lightBlue.shade400,
              value: cpi.patientQuestionnaire!.medicines!.contains('Antiagregantes'),
              onChanged: (value) {
                botonPulsado(cpi, 'Antiagregantes');
                setState(() {});
              },
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

            SizedBox(height: alto * 0.02),

            LinearPercentIndicator(
              percent: 0.66,
              lineHeight: 10.0,
              barRadius: const Radius.circular(10),
              progressColor: Colors.white,
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.02)),

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
                      Navigator.pushNamed(context, 'nervoussystemscreen', arguments: cpi);
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
