import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';

class NervousSystemScreen extends StatefulWidget {
  const NervousSystemScreen({super.key});

  @override
  State<NervousSystemScreen> createState() => _NervousSystemScreenState();
}

class _NervousSystemScreenState extends State<NervousSystemScreen> {

  void botonPulsado(ColonprepInfo cpi, String medicamento) {
    if(cpi.patientQuestionnaire!.medicines!.contains(medicamento)) {
      cpi.patientQuestionnaire!.medicines!.remove(medicamento);
    } else {
      cpi.patientQuestionnaire!.medicines!.add(medicamento);
    }
  
    cpi.patientQuestionnaire!.medicines!.remove('No nervioso');
  }

  void borrarMedicinas(ColonprepInfo cpi) {
    cpi.patientQuestionnaire!.medicines!.remove('Amitriptilina');
    cpi.patientQuestionnaire!.medicines!.remove('Imipranina');
    cpi.patientQuestionnaire!.medicines!.remove('Clomipramina');
    cpi.patientQuestionnaire!.medicines!.remove('Paroxetina');
    cpi.patientQuestionnaire!.medicines!.remove('Venlafaxina');
    cpi.patientQuestionnaire!.medicines!.remove('Risperidona');
    cpi.patientQuestionnaire!.medicines!.remove('Clozapina');
    cpi.patientQuestionnaire!.medicines!.remove('Olanzapina');
    cpi.patientQuestionnaire!.medicines!.remove('Haloperidol');
    cpi.patientQuestionnaire!.medicines!.remove('Amisulpiride');
    cpi.patientQuestionnaire!.medicines!.remove('Quetiapina');
    if(cpi.patientQuestionnaire!.medicines!.contains('No nervioso') == false) {
      cpi.patientQuestionnaire!.medicines!.add('No nervioso');
    }
  }

  bool algoSeleccionado(ColonprepInfo cpi) {
    if(cpi.patientQuestionnaire!.medicines!.contains('Amitriptilina') ||
    cpi.patientQuestionnaire!.medicines!.contains('Imipranina') ||
    cpi.patientQuestionnaire!.medicines!.contains('Clomipramina') ||
    cpi.patientQuestionnaire!.medicines!.contains('Paroxetina') ||
    cpi.patientQuestionnaire!.medicines!.contains('Venlafaxina') ||
    cpi.patientQuestionnaire!.medicines!.contains('Risperidona') ||
    cpi.patientQuestionnaire!.medicines!.contains('Clozapina') ||
    cpi.patientQuestionnaire!.medicines!.contains('Olanzapina') ||
    cpi.patientQuestionnaire!.medicines!.contains('Haloperidol') ||
    cpi.patientQuestionnaire!.medicines!.contains('Amisulpiride') ||
    cpi.patientQuestionnaire!.medicines!.contains('Quetiapina') ||
    cpi.patientQuestionnaire!.medicines!.contains('No nervioso')) {
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
              "- Pregunta 11 de 15 -",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.01)),

            const Text(
              "Medicinas para los nervios o la ansiedad",
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
                            
                        CheckboxListTile(
                          title: const Text("Amitriptilina (Tryptizol\u00AE)", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          checkColor: Colors.lightBlue.shade400,
                          value: cpi.patientQuestionnaire!.medicines!.contains('Amitriptilina'),
                          onChanged: (value) {
                            botonPulsado(cpi, 'Amitriptilina');
                            setState(() {});
                          },
                        ),
                            
                        CheckboxListTile(
                          title: const Text("Imipranina (Tofranil\u00AE)", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          checkColor: Colors.lightBlue.shade400,
                          value: cpi.patientQuestionnaire!.medicines!.contains('Imipranina'),
                          onChanged: (value) {
                            botonPulsado(cpi, 'Imipranina');
                            setState(() {});
                          },
                        ),
                            
                        CheckboxListTile(
                          title: const Text("Clomipramina (Anafranil\u00AE)", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          checkColor: Colors.lightBlue.shade400,
                          value: cpi.patientQuestionnaire!.medicines!.contains('Clomipramina'),
                          onChanged: (value) {
                            botonPulsado(cpi, 'Clomipramina');
                            setState(() {});
                          },
                        ),
                            
                        CheckboxListTile(
                          title: const Text("Paroxetina", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          checkColor: Colors.lightBlue.shade400,
                          value: cpi.patientQuestionnaire!.medicines!.contains('Paroxetina'),
                          onChanged: (value) {
                            botonPulsado(cpi, 'Paroxetina');
                            setState(() {});
                          },
                        ),
                            
                        CheckboxListTile(
                          title: const Text("Venlafaxina", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          checkColor: Colors.lightBlue.shade400,
                          value: cpi.patientQuestionnaire!.medicines!.contains('Venlafaxina'),
                          onChanged: (value) {
                            botonPulsado(cpi, 'Venlafaxina');
                            setState(() {});
                          },
                        ),
                            
                        CheckboxListTile(
                          title: const Text("Risperidona (Risperdal\u00AE)", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          checkColor: Colors.lightBlue.shade400,
                          value: cpi.patientQuestionnaire!.medicines!.contains('Risperidona'),
                          onChanged: (value) {
                            botonPulsado(cpi, 'Risperidona');
                            setState(() {});
                          },
                        ),
              
                        CheckboxListTile(
                          title: const Text("Clozapina (Leponex\u00AE, Nemea\u00AE)", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          checkColor: Colors.lightBlue.shade400,
                          value: cpi.patientQuestionnaire!.medicines!.contains('Clozapina'),
                          onChanged: (value) {
                            botonPulsado(cpi, 'Clozapina');
                            setState(() {});
                          },
                        ),
              
                        CheckboxListTile(
                          title: const Text("Olanzapina", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          checkColor: Colors.lightBlue.shade400,
                          value: cpi.patientQuestionnaire!.medicines!.contains('Olanzapina'),
                          onChanged: (value) {
                            botonPulsado(cpi, 'Olanzapina');
                            setState(() {});
                          },
                        ),
              
                        CheckboxListTile(
                          title: const Text("Haloperidol", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          checkColor: Colors.lightBlue.shade400,
                          value: cpi.patientQuestionnaire!.medicines!.contains('Haloperidol'),
                          onChanged: (value) {
                            botonPulsado(cpi, 'Haloperidol');
                            setState(() {});
                          },
                        ),
              
                        CheckboxListTile(
                          title: const Text("Amisulpiride", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          checkColor: Colors.lightBlue.shade400,
                          value: cpi.patientQuestionnaire!.medicines!.contains('Amisulpiride'),
                          onChanged: (value) {
                            botonPulsado(cpi, 'Amisulpiride');
                            setState(() {});
                          },
                        ),
              
                        CheckboxListTile(
                          title: const Text("Quetiapina (Seroquel\u00AE)", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          checkColor: Colors.lightBlue.shade400,
                          value: cpi.patientQuestionnaire!.medicines!.contains('Quetiapina'),
                          onChanged: (value) {
                            botonPulsado(cpi, 'Quetiapina');
                            setState(() {});
                          },
                        ),

                        CheckboxListTile(
                          title: const Text("NINGUNO DE ELLOS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          checkColor: Colors.lightBlue.shade400,
                          value: cpi.patientQuestionnaire!.medicines!.contains('No nervioso'),
                          onChanged: (value) {
                            borrarMedicinas(cpi);
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
                      Navigator.pushNamed(context, 'painscreen', arguments: cpi);
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
