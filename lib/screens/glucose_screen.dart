import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';

class GlucoseScreen extends StatefulWidget {
  const GlucoseScreen({super.key});

  @override
  State<GlucoseScreen> createState() => _GlucoseScreenState();
}

class _GlucoseScreenState extends State<GlucoseScreen> {

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
              "- Pregunta 6 de 15 -",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.01)),

            // const Text(
            //   "GLUCOSA",
            //   textAlign: TextAlign.center,
            //   textScaleFactor: 1.3,
            //   style: TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold),
            // ),

            // Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            Image.asset(
              "assets/images/diabetic.png",
              width: double.infinity,
              height: ancho * 0.2,
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            const Text(
              "¿Toma medicinas para controlar la glucosa, es diabético?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            ElevatedButton(
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.white),
                minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                backgroundColor: (cpi.patientQuestionnaire?.isDiabetic == true) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                foregroundColor: (cpi.patientQuestionnaire?.isDiabetic == true) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white, width: 2)
                  )
                )
              ),
              onPressed: () {
                cpi.patientQuestionnaire?.isDiabetic = true;
                setState(() {});
              },
              child: const Text('Sí'),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.02)),

            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                backgroundColor: (cpi.patientQuestionnaire?.isDiabetic == false) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                foregroundColor: (cpi.patientQuestionnaire?.isDiabetic == false) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white, width: 2)
                  )
                )
              ),
              onPressed: () {
                cpi.patientQuestionnaire?.isDiabetic = false;
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

                (cpi.patientQuestionnaire?.isDiabetic != null) ? Padding(padding: EdgeInsets.only(left: ancho * 0.05)) : Container(),

                (cpi.patientQuestionnaire?.isDiabetic != null) ? Expanded(
                  child: CupertinoButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'parkinsonscreen', arguments: cpi);
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
