import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../services/local_shared_preferences.dart';

class PainScreen extends StatefulWidget {
  const PainScreen({super.key});

  @override
  State<PainScreen> createState() => _PainScreenState();
}

class _PainScreenState extends State<PainScreen> {

  late bool medicine;
  bool _fentanilo = false;
  bool _tramadol = false;

  @override
  void initState() {
    super.initState();
    medicine = ((LocalSharedPreferences.prefs.containsKey('medicine')) ? LocalSharedPreferences.prefs.getBool('medicine') : false)!;
  }

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
              "MEDICACIÓN",
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            Image.asset(
              "assets/images/medicamento.png",
              width: double.infinity,
              height: ancho * 0.3,
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            const Text(
              "¿Toma alguno de los siguientes fármacos para el control del dolor? Marque todos los que tome",
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            CheckboxListTile(
              title: ElevatedButton(
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                  backgroundColor: (_fentanilo) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                  foregroundColor: (_fentanilo) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.white, width: 2)
                    )
                  )
                ),
                onPressed: () {
                  _fentanilo = !_fentanilo;
                  setState(() {});
                },
                child: const Text("Fentanilo (Actiq, Durogesic, Fendivia)", textAlign: TextAlign.center),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.white,
              checkColor: Colors.lightBlue.shade400,
              value: _fentanilo,
              onChanged: (value) {
                _fentanilo=value!;
                setState(() {});
              },
            ),

            CheckboxListTile(
              title: ElevatedButton(
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                  backgroundColor: (_tramadol) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                  foregroundColor: (_tramadol) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.white, width: 2)
                    )
                  )
                ),
                onPressed: () {
                  _tramadol = !_tramadol;
                  setState(() {});
                },
                child: const Text("Tramadol (Adolonta, Zaldiar)", textAlign: TextAlign.center),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.white,
              checkColor: Colors.lightBlue.shade400,
              value: _tramadol,
              onChanged: (value) {
                _tramadol=value!;
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
              percent: 0.9,
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
                      Navigator.pushNamed(context, 'bloodpressurescreen');
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
