import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
              "MEDICACIÓN",
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
              "¿Toma alguno de los siguientes fármacos? Marque todos los que tome:",
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
                            
                        CheckboxListTile(
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Amitriptilina')) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Amitriptilina')) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              botonPulsado(cpi, 'Amitriptilina');
                              setState(() {});
                            },
                            child: const Text("Amitriptilina (Tryptizol\u00AE)", textAlign: TextAlign.center),
                          ),
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
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Imipranina')) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Imipranina')) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              botonPulsado(cpi, 'Imipranina');
                              setState(() {});
                            },
                            child: const Text("Imipranina (Tofranil\u00AE)", textAlign: TextAlign.center),
                          ),
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
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Clomipramina')) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Clomipramina')) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              botonPulsado(cpi, 'Clomipramina');
                              setState(() {});
                            },
                            child: const Text("Clomipramina (Anafranil\u00AE)", textAlign: TextAlign.center),
                          ),
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
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Paroxetina')) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Paroxetina')) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              botonPulsado(cpi, 'Paroxetina');
                              setState(() {});
                            },
                            child: const Text("Paroxetina", textAlign: TextAlign.center),
                          ),
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
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Venlafaxina')) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Venlafaxina')) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              botonPulsado(cpi, 'Venlafaxina');
                              setState(() {});
                            },
                            child: const Text("Venlafaxina", textAlign: TextAlign.center),
                          ),
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
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Risperidona')) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Risperidona')) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              botonPulsado(cpi, 'Risperidona');
                              setState(() {});
                            },
                            child: const Text("Risperidona (Risperdal\u00AE)", textAlign: TextAlign.center),
                          ),
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
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Clozapina')) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Clozapina')) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              botonPulsado(cpi, 'Clozapina');
                              setState(() {});
                            },
                            child: const Text("Clozapina (Leponex\u00AE, Nemea\u00AE)", textAlign: TextAlign.center),
                          ),
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
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Olanzapina')) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Olanzapina')) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              botonPulsado(cpi, 'Olanzapina');
                              setState(() {});
                            },
                            child: const Text("Olanzapina", textAlign: TextAlign.center),
                          ),
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
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Haloperidol')) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Haloperidol')) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              botonPulsado(cpi, 'Haloperidol');
                              setState(() {});
                            },
                            child: const Text("Haloperidol", textAlign: TextAlign.center),
                          ),
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
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Amisulpiride')) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Amisulpiride')) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              botonPulsado(cpi, 'Amisulpiride');
                              setState(() {});
                            },
                            child: const Text("Amisulpiride", textAlign: TextAlign.center),
                          ),
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
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Quetiapina')) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (cpi.patientQuestionnaire!.medicines!.contains('Quetiapina')) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              botonPulsado(cpi, 'Quetiapina');
                              setState(() {});
                            },
                            child: const Text("Quetiapina (Seroquel\u00AE)", textAlign: TextAlign.center),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          checkColor: Colors.lightBlue.shade400,
                          value: cpi.patientQuestionnaire!.medicines!.contains('Quetiapina'),
                          onChanged: (value) {
                            botonPulsado(cpi, 'Quetiapina');
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

            LinearPercentIndicator(
              percent: 0.73,
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
