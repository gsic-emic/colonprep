import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/services/local_shared_preferences.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class NervousSystemScreen extends StatefulWidget {
  const NervousSystemScreen({super.key});

  @override
  State<NervousSystemScreen> createState() => _NervousSystemScreenState();
}

class _NervousSystemScreenState extends State<NervousSystemScreen> {

  late bool medicine;
  bool _amitriptilina = false;
  bool _imipranina = false;
  bool _clomipramina = false;
  bool _paroxetina = false;
  bool _venlafaxina = false;
  bool _risperidona = false;
  bool _clozapina = false;
  bool _olanzapina = false;
  bool _haloperidol = false;
  bool _amisulpiride = false;
  bool _quetiapina = false;

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
              "assets/images/medicine.png",
              width: double.infinity,
              height: ancho * 0.3,
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            const Text(
              "¿Toma alguno de los siguientes fármacos relacionados con el sistema nervioso (ansiedad, trastornos del estado de ánimo, para ayudarle a dormir...)?",
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.white),
            ),
            const Text(
              "Marque todos los que tome de forma habitual:",
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
                              backgroundColor: (_amitriptilina) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (_amitriptilina) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              _amitriptilina = !_amitriptilina;
                              setState(() {});
                            },
                            child: const Text("Amitriptilina (Tryptizol)", textAlign: TextAlign.center),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          checkColor: Colors.lightBlue.shade400,
                          value: _amitriptilina,
                          onChanged: (value) {
                            _amitriptilina=value!;
                            setState(() {});
                          },
                        ),
                            
                        CheckboxListTile(
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (_imipranina) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (_imipranina) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              _imipranina = !_imipranina;
                              setState(() {});
                            },
                            child: const Text("Imipranina (Tofranil)", textAlign: TextAlign.center),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          value: _imipranina,
                          onChanged: (value) {
                            _imipranina=value!;
                            setState(() {});
                          },
                        ),
                            
                        CheckboxListTile(
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (_clomipramina) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (_clomipramina) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              _clomipramina = !_clomipramina;
                              setState(() {});
                            },
                            child: const Text("Clomipramina (Anafranil)", textAlign: TextAlign.center),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          value: _clomipramina,
                          onChanged: (value) {
                            _clomipramina=value!;
                            setState(() {});
                          },
                        ),
                            
                        CheckboxListTile(
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (_paroxetina) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (_paroxetina) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              _paroxetina = !_paroxetina;
                              setState(() {});
                            },
                            child: const Text("Paroxetina", textAlign: TextAlign.center),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          value: _paroxetina,
                          onChanged: (value) {
                            _paroxetina=value!;
                            setState(() {});
                          },
                        ),
                            
                        CheckboxListTile(
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (_venlafaxina) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (_venlafaxina) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              _venlafaxina = !_venlafaxina;
                              setState(() {});
                            },
                            child: const Text("Venlafaxina", textAlign: TextAlign.center),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          value: _venlafaxina,
                          onChanged: (value) {
                            _venlafaxina=value!;
                            setState(() {});
                          },
                        ),
                            
                        CheckboxListTile(
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (_risperidona) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (_risperidona) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              _risperidona = !_risperidona;
                              setState(() {});
                            },
                            child: const Text("Risperidona (Risperdal)", textAlign: TextAlign.center),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          value: _risperidona,
                          onChanged: (value) {
                            _risperidona=value!;
                            setState(() {});
                          },
                        ),
              
                        CheckboxListTile(
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (_clozapina) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (_clozapina) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              _clozapina = !_clozapina;
                              setState(() {});
                            },
                            child: const Text("Clozapina (Leponex, Nemea)", textAlign: TextAlign.center),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          value: _clozapina,
                          onChanged: (value) {
                            _clozapina=value!;
                            setState(() {});
                          },
                        ),
              
                        CheckboxListTile(
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (_olanzapina) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (_olanzapina) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              _olanzapina = !_olanzapina;
                              setState(() {});
                            },
                            child: const Text("Olanzapina", textAlign: TextAlign.center),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          value: _olanzapina,
                          onChanged: (value) {
                            _olanzapina=value!;
                            setState(() {});
                          },
                        ),
              
                        CheckboxListTile(
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (_haloperidol) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (_haloperidol) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              _haloperidol = !_haloperidol;
                              setState(() {});
                            },
                            child: const Text("Haloperidol", textAlign: TextAlign.center),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          value: _haloperidol,
                          onChanged: (value) {
                            _haloperidol=value!;
                            setState(() {});
                          },
                        ),
              
                        CheckboxListTile(
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (_amisulpiride) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (_amisulpiride) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              _amisulpiride = !_amisulpiride;
                              setState(() {});
                            },
                            child: const Text("Amisulpiride", textAlign: TextAlign.center),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          value: _amisulpiride,
                          onChanged: (value) {
                            _amisulpiride=value!;
                            setState(() {});
                          },
                        ),
              
                        CheckboxListTile(
                          title: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.05)),
                              backgroundColor: (_quetiapina) ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.lightBlue.shade400),
                              foregroundColor: (_quetiapina) ? MaterialStateProperty.all(Colors.lightBlue.shade400) : null,
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white, width: 2)
                                )
                              )
                            ),
                            onPressed: () {
                              _quetiapina = !_quetiapina;
                              setState(() {});
                            },
                            child: const Text("Quetiapina (Seroquel)", textAlign: TextAlign.center),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          value: _quetiapina,
                          onChanged: (value) {
                            _quetiapina=value!;
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
              percent: 0.8,
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
                      Navigator.pushNamed(context, 'painscreen');
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
