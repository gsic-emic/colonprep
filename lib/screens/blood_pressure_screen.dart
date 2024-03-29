import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';

class BloodPressureScreen extends StatefulWidget {
  const BloodPressureScreen({super.key});

  @override
  State<BloodPressureScreen> createState() => _BloodPressureScreenState();
}

class _BloodPressureScreenState extends State<BloodPressureScreen> {

  void botonPulsado(ColonprepInfo cpi, String medicamento) {
    if(cpi.patientQuestionnaire!.medicines!.contains(medicamento)) {
      cpi.patientQuestionnaire!.medicines!.remove(medicamento);
    } else {
      cpi.patientQuestionnaire!.medicines!.add(medicamento);
    }
  
    cpi.patientQuestionnaire!.medicines!.remove('No tension');
  }

  void borrarMedicinas(ColonprepInfo cpi) {
    cpi.patientQuestionnaire!.medicines!.remove('Amlodipino');
    cpi.patientQuestionnaire!.medicines!.remove('Diltiazem');
    cpi.patientQuestionnaire!.medicines!.remove('Nicardipino');
    if(cpi.patientQuestionnaire!.medicines!.contains('No tension') == false) {
      cpi.patientQuestionnaire!.medicines!.add('No tension');
    }
  }

  bool algoSeleccionado(ColonprepInfo cpi) {
    if(cpi.patientQuestionnaire!.medicines!.contains('Amlodipino') ||
    cpi.patientQuestionnaire!.medicines!.contains('Diltiazem') ||
    cpi.patientQuestionnaire!.medicines!.contains('Nicardipino') ||
    cpi.patientQuestionnaire!.medicines!.contains('No tension')) {
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
              "- Pregunta 13 de 15 -",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.01)),

            const Text(
              "Medicinas para el corazón o la tensión arterial",
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
              title: const Text("Amlodipino", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.white,
              checkColor: Colors.lightBlue.shade400,
              value: cpi.patientQuestionnaire!.medicines!.contains('Amlodipino'),
              onChanged: (value) {
                botonPulsado(cpi, 'Amlodipino');
                setState(() {});
              },
            ),

            CheckboxListTile(
              title: const Text("Diltiazem", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.white,
              checkColor: Colors.lightBlue.shade400,
              value: cpi.patientQuestionnaire!.medicines!.contains('Diltiazem'),
              onChanged: (value) {
                botonPulsado(cpi, 'Diltiazem');
                setState(() {});
              },
            ),

            CheckboxListTile(
              title: const Text("Nicardipino", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.white,
              checkColor: Colors.lightBlue.shade400,
              value: cpi.patientQuestionnaire!.medicines!.contains('Nicardipino'),
              onChanged: (value) {
                botonPulsado(cpi, 'Nicardipino');
                setState(() {});
              },
            ),

            CheckboxListTile(
              title: const Text("NINGUNO DE ELLOS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.white,
              checkColor: Colors.lightBlue.shade400,
              value: cpi.patientQuestionnaire!.medicines!.contains('No tension'),
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
                      Navigator.pushNamed(context, 'colonoscopyscreen', arguments: cpi);
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
