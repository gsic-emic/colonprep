import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {

  late FixedExtentScrollController _scrollController;
  final int minWeight = 30;
  final int maxWeight = 180;

  @override
  Widget build(BuildContext context) {

    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;

    List<Widget> pickerItems = [
      const Text('-', style: TextStyle(color: Colors.white), textScaleFactor: 1.2),
      ...List.generate(maxWeight - minWeight + 1, (index) {
        int weight = index + minWeight;
        return Text('$weight kg', style: const TextStyle(color: Colors.white), textScaleFactor: 1.2);
      }),
    ];

    ColonprepInfo cpi = ModalRoute.of(context)!.settings.arguments as ColonprepInfo;
    cpi.patientQuestionnaire?.weightKg = (cpi.patientQuestionnaire?.weightKg == null) ? null : cpi.patientQuestionnaire?.weightKg;
    _scrollController = FixedExtentScrollController(initialItem: (cpi.patientQuestionnaire?.weightKg == null) ? 0 : (cpi.patientQuestionnaire!.weightKg! - minWeight + 1));

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
        child: Column(
          children: [

            Padding(padding: EdgeInsets.only(top: alto * 0.07)),

            const Text(
              "- Pregunta 3 de 15 -",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            Image.asset(
              "assets/images/weightHeight.png",
              width: double.infinity,
              height: ancho * 0.2,
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            const Text(
              "Introduzca su peso:",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                height: alto * 0.3,
                child: CupertinoTheme(
                  data: const CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(color: Colors.white),
                    )
                  ),
                  child: CupertinoPicker(
                    scrollController: _scrollController,
                    itemExtent: 32,
                    onSelectedItemChanged: (index) {
                      cpi.patientQuestionnaire?.weightKg = (index == 0) ? null : (index + minWeight - 1);
                      setState(() {});
                    },
                    children: pickerItems,
                  ),
                ),
              ),
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

                (cpi.patientQuestionnaire?.weightKg != null) ? Padding(padding: EdgeInsets.only(left: ancho * 0.05)) : Container(),

                (cpi.patientQuestionnaire?.weightKg != null) ? Expanded(
                  child: CupertinoButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'heightscreen', arguments: cpi);
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
