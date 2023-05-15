import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PreparationScreen extends StatefulWidget {
  const PreparationScreen({super.key});

  @override
  State<PreparationScreen> createState() => _PreparationScreenState();
}

class _PreparationScreenState extends State<PreparationScreen> {

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
    cpi.preparation?.product ??= 'none';

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
        child: Column(
          children: [

            Padding(padding: EdgeInsets.only(top: alto * 0.1)),

            const Text(
              "PREPARACIÓN",
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
              "¿Ha recogido ya su preparado?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                backgroundColor: (cpi.preparation?.product == 'Bohn o Casenglicol') ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                foregroundColor: (cpi.preparation?.product == 'Bohn o Casenglicol') ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white, width: 2)
                  )
                )
              ),
              onPressed: () {
                cpi.preparation?.product = 'Bohn o Casenglicol';
                cpi.preparationCollected = true;
                setState(() {});
              },
              child: const Text('Solución de Bohn o Casenglicol'),
            ),
            
            Padding(padding: EdgeInsets.only(top: alto * 0.02)),

            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                backgroundColor: (cpi.preparation?.product == 'Pleinvue') ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                foregroundColor: (cpi.preparation?.product == 'Pleinvue') ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white, width: 2)
                  )
                )
              ),
              onPressed: () {
                cpi.preparation?.product = 'Pleinvue';
                cpi.preparationCollected = true;
                setState(() {});
              },
              child: const Text('Pleinvue'),
            ),
            
            Padding(padding: EdgeInsets.only(top: alto * 0.02)),

            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                backgroundColor: (cpi.preparation?.product == 'CitraFleet') ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                foregroundColor: (cpi.preparation?.product == 'CitraFleet') ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white, width: 2)
                  )
                )
              ),
              onPressed: () {
                cpi.preparation?.product = 'CitraFleet';
                cpi.preparationCollected = true;
                setState(() {});
              },
              child: const Text('CitraFleet'),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.02)),

            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                backgroundColor: (cpi.preparation?.product == 'Moviprep') ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                foregroundColor: (cpi.preparation?.product == 'Moviprep') ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white, width: 2)
                  )
                )
              ),
              onPressed: () {
                cpi.preparation?.product = 'Moviprep';
                cpi.preparationCollected = true;
                setState(() {});
              },
              child: const Text('Moviprep'),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.02)),

            ElevatedButton(
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.white),
                minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                backgroundColor: (cpi.preparation?.product == 'Todavía no lo he recogido') ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                foregroundColor: (cpi.preparation?.product == 'Todavía no lo he recogido') ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white, width: 2)
                  )
                )
              ),
              onPressed: () {
                cpi.preparation?.product = 'Todavía no lo he recogido';
                cpi.preparationCollected = false;
                setState(() {});
              },
              child: const Text('Todavía no lo he recogido'),
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
              percent: 0.93,
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
                      Navigator.pushNamed(context, 'summaryscreen', arguments: cpi);
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
