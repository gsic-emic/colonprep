import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';

class PainScreen extends StatefulWidget {
  const PainScreen({super.key});

  @override
  State<PainScreen> createState() => _PainScreenState();
}

class _PainScreenState extends State<PainScreen> {

  void botonPulsado(ColonprepInfo cpi, String medicamento) {
    if(cpi.patientQuestionnaire!.medicines!.contains(medicamento)) {
      cpi.patientQuestionnaire!.medicines!.remove(medicamento);
    } else {
      cpi.patientQuestionnaire!.medicines!.add(medicamento);
    }

    cpi.patientQuestionnaire!.medicines!.remove('No dolor');
  }

  void borrarMedicinas(ColonprepInfo cpi) {
    cpi.patientQuestionnaire!.medicines!.remove('Fentanilo');
    cpi.patientQuestionnaire!.medicines!.remove('Tramadol');
    if(cpi.patientQuestionnaire!.medicines!.contains('No dolor') == false) {
      cpi.patientQuestionnaire!.medicines!.add('No dolor');
    }
  }

  bool algoSeleccionado(ColonprepInfo cpi) {
    if(cpi.patientQuestionnaire!.medicines!.contains('Fentanilo') ||
    cpi.patientQuestionnaire!.medicines!.contains('Tramadol') ||
    cpi.patientQuestionnaire!.medicines!.contains('No dolor')) {
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

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
        child: Column(
          children: [

            Padding(padding: EdgeInsets.only(top: alto * 0.07)),

            const Text(
              "- Pregunta 12 de 15 -",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.01)),

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
              height: ancho * 0.2,
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            const Text(
              "¿Toma alguno de los siguientes fármacos? Marque todos los que tome:",
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            CheckboxListTile(
              title: const Text("Fentanilo (Actiq\u00AE, Durogesic\u00AE, Fendivia\u00AE)", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.white,
              checkColor: Colors.lightBlue.shade400,
              value: cpi.patientQuestionnaire!.medicines!.contains('Fentanilo'),
              onChanged: (value) {
                botonPulsado(cpi, 'Fentanilo');
                setState(() {});
              },
            ),

            CheckboxListTile(
              title: const Text("Tramadol (Adolonta\u00AE, Zaldiar\u00AE)", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.white,
              checkColor: Colors.lightBlue.shade400,
              value: cpi.patientQuestionnaire!.medicines!.contains('Tramadol'),
              onChanged: (value) {
                botonPulsado(cpi, 'Tramadol');
                setState(() {});
              },
            ),

            CheckboxListTile(
              title: const Text("Ninguna de ellas", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.white,
              checkColor: Colors.lightBlue.shade400,
              value: cpi.patientQuestionnaire!.medicines!.contains('No dolor'),
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
                      Navigator.pushNamed(context, 'bloodpressurescreen', arguments: cpi);
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
