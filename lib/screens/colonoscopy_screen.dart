import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';

class ColonoscopyScreen extends StatefulWidget {
  const ColonoscopyScreen({super.key});

  @override
  State<ColonoscopyScreen> createState() => _ColonoscopyScreenState();
}

class _ColonoscopyScreenState extends State<ColonoscopyScreen> {

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
              "- Pregunta 14 de 15 -",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            Image.asset(
              "assets/images/colonoscopy.png",
              width: double.infinity,
              height: ancho * 0.2,
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            const Text(
              "¿Se ha realizado una colonoscopia previamente y no consiguió una adecuada limpieza del colon?",
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            ElevatedButton(
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.white),
                minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                backgroundColor: (cpi.patientQuestionnaire?.hasPreviousBadColonoscopy == true) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                foregroundColor: (cpi.patientQuestionnaire?.hasPreviousBadColonoscopy == true) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white, width: 2)
                  )
                )
              ),
              onPressed: () {
                cpi.patientQuestionnaire?.hasPreviousBadColonoscopy = true;
                setState(() {});
              },
              child: const Text('Sí'),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.02)),

            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                backgroundColor: (cpi.patientQuestionnaire?.hasPreviousBadColonoscopy == false) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                foregroundColor: (cpi.patientQuestionnaire?.hasPreviousBadColonoscopy == false) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white, width: 2)
                  )
                )
              ),
              onPressed: () {
                cpi.patientQuestionnaire?.hasPreviousBadColonoscopy = false;
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

                (cpi.patientQuestionnaire?.hasPreviousBadColonoscopy != null) ? Padding(padding: EdgeInsets.only(left: ancho * 0.05)) : Container(),

                (cpi.patientQuestionnaire?.hasPreviousBadColonoscopy != null) ? Expanded(
                  child: CupertinoButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'preparationscreen', arguments: cpi);
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
