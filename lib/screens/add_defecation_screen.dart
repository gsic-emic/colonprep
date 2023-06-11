import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';
import 'package:hospital/models/defecation_report.dart';

class AddDefecationScreen extends StatefulWidget {
  const AddDefecationScreen({super.key});

  @override
  State<AddDefecationScreen> createState() => _AddDefecationScreenState();
}

class _AddDefecationScreenState extends State<AddDefecationScreen> {

  late DefecationReport dr = DefecationReport();

  bool algoSeleccionado() {
    if(dr.defecationAspect == 'aspectA' ||
    dr.defecationAspect == 'aspectB' ||
    dr.defecationAspect == 'aspectC' ||
    dr.defecationAspect == 'aspectD') {
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

            Padding(padding: EdgeInsets.only(top: alto * 0.1)),

            const Text(
              "ÚLTIMA DEPOSICIÓN",
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            const Text(
              "Seleccione el color que más se parece al de su última deposición:",
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                            
                        RadioListTile(
                          title: Image.asset("assets/images/aspectA.jpg", width: double.infinity, height: ancho * 0.3),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          groupValue: dr.defecationAspect,
                          value: 'aspectA',
                          onChanged: (value) {
                            dr.defecationAspect = 'aspectA';
                            setState(() {});
                          },
                        ),

                        RadioListTile(
                          title: Image.asset("assets/images/aspectB.jpg", width: double.infinity, height: ancho * 0.3),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          groupValue: dr.defecationAspect,
                          value: 'aspectB',
                          onChanged: (value) {
                            dr.defecationAspect = 'aspectB';
                            setState(() {});
                          },
                        ),

                        RadioListTile(
                          title: Image.asset("assets/images/aspectC.jpg", width: double.infinity, height: ancho * 0.3),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          groupValue: dr.defecationAspect,
                          value: 'aspectC',
                          onChanged: (value) {
                            dr.defecationAspect = 'aspectC';
                            setState(() {});
                          },
                        ),
                            
                      ],
                    ),
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

            SizedBox(height: alto * 0.02),

            Row(
              children: [

                (algoSeleccionado()) ? Expanded(
                  child: CupertinoButton(
                    onPressed: () {
                      dr.dateTime = DateTime.now();
                      cpi.preparation?.defecationReports?.add(dr);
                      cpi.saveColonprepInfo();
                      Navigator.pop(context);
                    },
                    color: Colors.green,
                    padding:
                        EdgeInsets.only(top: alto * 0.015, bottom: alto * 0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.assignment_turned_in_outlined),
                        Padding(padding: EdgeInsets.only(left: ancho * 0.02)),
                        const Text("Añadir", textScaleFactor: 1.2),
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
