import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AbdominalSurgeryScreen extends StatefulWidget {
  const AbdominalSurgeryScreen({super.key});

  @override
  State<AbdominalSurgeryScreen> createState() => _AbdominalSurgeryScreenState();
}

class _AbdominalSurgeryScreenState extends State<AbdominalSurgeryScreen> {

  @override
  Widget build(BuildContext context) {

    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;

    ColonprepInfo cpi = ModalRoute.of(context)!.settings.arguments as ColonprepInfo;
    cpi.patientQuestionnaire?.hasAbdomenOrPelvisSurgery ??= false;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
        child: Column(
          children: [

            Padding(padding: EdgeInsets.only(top: alto * 0.1)),

            const Text(
              "OPERACIÓN",
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            Image.asset(
              "assets/images/surgery.png",
              width: double.infinity,
              height: ancho * 0.3,
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            const Text(
              "¿Le han operado del abdomen o de la pelvis?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            ElevatedButton(
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.white),
                minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                backgroundColor: (cpi.patientQuestionnaire?.hasAbdomenOrPelvisSurgery as bool) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                foregroundColor: (cpi.patientQuestionnaire?.hasAbdomenOrPelvisSurgery as bool) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white, width: 2)
                  )
                )
              ),
              onPressed: () {
                cpi.patientQuestionnaire?.hasAbdomenOrPelvisSurgery = true;
                setState(() {});
              },
              child: const Text('Sí'),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.02)),

            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                backgroundColor: (!(cpi.patientQuestionnaire?.hasAbdomenOrPelvisSurgery as bool)) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                foregroundColor: (!(cpi.patientQuestionnaire?.hasAbdomenOrPelvisSurgery as bool)) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white, width: 2)
                  )
                )
              ),
              onPressed: () {
                cpi.patientQuestionnaire?.hasAbdomenOrPelvisSurgery = false;
                setState(() {});
              },
              child: const Text('No'),
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

            LinearPercentIndicator(
              percent: 0.6,
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
                      Navigator.pushNamed(context, 'medicinescreen', arguments: cpi);
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
