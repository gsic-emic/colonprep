import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';

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

    cpi.patientQuestionnaire!.medicines!.remove('No otros');
  }

  void borrarMedicinas(ColonprepInfo cpi) {
    cpi.patientQuestionnaire!.medicines!.remove('Hierro');
    cpi.patientQuestionnaire!.medicines!.remove('Anticoagulantes orales');
    cpi.patientQuestionnaire!.medicines!.remove('Antiagregantes');
    if(cpi.patientQuestionnaire!.medicines!.contains('No otros') == false) {
      cpi.patientQuestionnaire!.medicines!.add('No otros');
    }
  }

  bool algoSeleccionado(ColonprepInfo cpi) {
    if(cpi.patientQuestionnaire!.medicines!.contains('Hierro') ||
    cpi.patientQuestionnaire!.medicines!.contains('Anticoagulantes orales') ||
    cpi.patientQuestionnaire!.medicines!.contains('Antiagregantes') ||
    cpi.patientQuestionnaire!.medicines!.contains('No otros')) {
      return true;
    } else {
      return false;
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

            Padding(padding: EdgeInsets.only(top: alto * 0.07)),

            const Text(
              "- Pregunta 10 de 15 -",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.01)),

            const Text(
              "MEDICINAS",
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
              height: ancho * 0.2,
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            CheckboxListTile(
              title: const Text("Hierro", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.white,
              checkColor: Colors.lightBlue.shade400,
              value: cpi.patientQuestionnaire!.medicines!.contains('Hierro'),
              onChanged: (value) {
                botonPulsado(cpi, 'Hierro');
                setState(() {});
                if(cpi.patientQuestionnaire!.medicines!.contains('Hierro') == true) {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text('Información'),
                        content: const Text('Para una mejor preparación, deberá suspender la toma de hierro 5 días antes de la prueba'),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('Entendido'),
                            onPressed: () => Navigator.pop(context)
                          ),
                        ],
                      );
                    }
                  );
                }
              },
            ),

            CheckboxListTile(
              title: const Text("Anticoagulantes orales", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.white,
              checkColor: Colors.lightBlue.shade400,
              value: cpi.patientQuestionnaire!.medicines!.contains('Anticoagulantes orales'),
              onChanged: (value) {
                botonPulsado(cpi, 'Anticoagulantes orales');
                setState(() {});
                if(cpi.patientQuestionnaire!.medicines!.contains('Anticoagulantes orales') == true) {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text('Información'),
                        content: const Text('Deberá contactar con su Médico de Atención Primaria para revisar su medicación'),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('Entendido'),
                            onPressed: () => Navigator.pop(context)
                          ),
                        ],
                      );
                    }
                  );
                }
              },
            ),

            CheckboxListTile(
              title: const Text("Antiagregantes", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.white,
              checkColor: Colors.lightBlue.shade400,
              value: cpi.patientQuestionnaire!.medicines!.contains('Antiagregantes'),
              onChanged: (value) {
                botonPulsado(cpi, 'Antiagregantes');
                setState(() {});
                if(cpi.patientQuestionnaire!.medicines!.contains('Antiagregantes') == true) {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text('Información'),
                        content: const Text('Deberá contactar con su Médico de Atención Primaria para revisar su medicación'),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('Entendido'),
                            onPressed: () => Navigator.pop(context)
                          ),
                        ],
                      );
                    }
                  );
                }
              },
            ),

            CheckboxListTile(
              title: const Text("NINGUNO DE ELLOS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.white,
              checkColor: Colors.lightBlue.shade400,
              value: cpi.patientQuestionnaire!.medicines!.contains('No otros'),
              onChanged: (value) {
                borrarMedicinas(cpi);
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

                (algoSeleccionado(cpi)) ? Padding(padding: EdgeInsets.only(left: ancho * 0.05)) : Container(),

                (algoSeleccionado(cpi)) ? Expanded(
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
                ) : Container(),

              ],
            ),

            Padding(padding: EdgeInsets.only(bottom: alto * 0.05)),

          ],
        ),
      ),
    );
  }
}
