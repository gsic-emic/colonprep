import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {

  late FixedExtentScrollController _scrollController;
  final int minHeight = 150;
  final int maxHeight = 210;

  @override
  Widget build(BuildContext context) {

    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;

    List<Widget> pickerItems = [
      const Text('-', style: TextStyle(color: Colors.white), textScaleFactor: 1.2),
      ...List.generate(maxHeight - minHeight + 1, (index) {
        int height = index + minHeight;
        return Text('$height cm', style: const TextStyle(color: Colors.white), textScaleFactor: 1.2);
      }),
    ];

    ColonprepInfo cpi = ModalRoute.of(context)!.settings.arguments as ColonprepInfo;
    cpi.patientQuestionnaire?.heightCm = (cpi.patientQuestionnaire?.heightCm == null) ? null : cpi.patientQuestionnaire?.heightCm;
    _scrollController = FixedExtentScrollController(initialItem: (cpi.patientQuestionnaire?.heightCm == null) ? 0 : (cpi.patientQuestionnaire!.heightCm! - minHeight + 1));

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
        child: Column(
          children: [

            Padding(padding: EdgeInsets.only(top: alto * 0.07)),

            const Text(
              "- Pregunta 4 de 15 -",
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
              "Introduzca su altura:",
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
                      cpi.patientQuestionnaire?.heightCm = (index == 0) ? null : (index + minHeight - 1);
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

                (cpi.patientQuestionnaire?.heightCm != null) ? Padding(padding: EdgeInsets.only(left: ancho * 0.05)) : Container(),

                (cpi.patientQuestionnaire?.heightCm != null) ? Expanded(
                  child: CupertinoButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'defecationscreen', arguments: cpi);
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
