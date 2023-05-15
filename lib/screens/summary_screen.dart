import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';
import 'package:hospital/tools/tools.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {

  @override
  Widget build(BuildContext context) {

    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;

    const textScaleFactor = 1.15;

    ColonprepInfo cpi = ModalRoute.of(context)!.settings.arguments as ColonprepInfo;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
        child: Column(
          children: [

            Padding(padding: EdgeInsets.only(top: alto * 0.1)),

            const Center(
              child: Text(
                "RESUMEN",
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [

                  const Text(
                    "Compruebe que todos los datos introducidos son correctos",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white),
                    textScaleFactor: 1.1
                  ),

                  Padding(padding: EdgeInsets.only(top: alto * 0.05)),
                  Container(
                    color: Colors.white,
                    height: 1,
                  ),
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),

                  const Text('Fecha y hora', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor),
                  Text(Tools.formatDate(cpi.appointment?.dateTimeAppointment as DateTime), style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                  
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                  Container(
                    color: Colors.white,
                    height: 1,
                  ),
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),

                  const Text('Peso', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor),
                  Text('${cpi.patientQuestionnaire?.weightKg} Kg', style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                  
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                  Container(
                    color: Colors.white,
                    height: 1,
                  ),
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),

                  const Text('Altura', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor),
                  Text('${cpi.patientQuestionnaire?.heightCm} Cm', style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                  
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                  Container(
                    color: Colors.white,
                    height: 1,
                  ),
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),

                  const Text('¿Tiene menos de 3 deposiciones a la semana?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor),
                  Text((cpi.patientQuestionnaire?.constipation == true) ? 'Sí': 'No', style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                  
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                  Container(
                    color: Colors.white,
                    height: 1,
                  ),
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),

                  const Text('¿Toma medicinas para controlar la glucosa, es diabético?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor),
                  Text((cpi.patientQuestionnaire?.isDiabetic == true) ? 'Sí': 'No', style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                  
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                  Container(
                    color: Colors.white,
                    height: 1,
                  ),
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),

                  const Text('¿Está diagnosticado de enfermedad de Parkinson?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor),
                  Text((cpi.patientQuestionnaire?.hasParkinson == true) ? 'Sí': 'No', style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                  
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                  Container(
                    color: Colors.white,
                    height: 1,
                  ),
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),

                  const Text('¿Le han operado de cirugía bariátrica?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor),
                  Text((cpi.patientQuestionnaire?.hasBariatricSurgery == true) ? 'Sí': 'No', style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                  
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                  Container(
                    color: Colors.white,
                    height: 1,
                  ),
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),

                  const Text('¿Le han operado del abdomen o de la pelvis?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor),
                  Text((cpi.patientQuestionnaire?.hasAbdomenOrPelvisSurgery == true) ? 'Sí': 'No', style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                  
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                  Container(
                    color: Colors.white,
                    height: 1,
                  ),
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),

                  const Text('Medicaciones', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor),
                  Text((cpi.patientQuestionnaire?.medicines?.isNotEmpty ?? false) ? (cpi.patientQuestionnaire?.medicines?.join(', ') ?? '') : ('No'), style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                  
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                  Container(
                    color: Colors.white,
                    height: 1,
                  ),
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),

                  const Text('¿Se ha realizado una colonoscopia previamente y no consiguió una adecuada limpieza del colon?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor),
                  Text((cpi.patientQuestionnaire?.hasPreviousBadColonoscopy == true) ? 'Sí': 'No', style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                  
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                  Container(
                    color: Colors.white,
                    height: 1,
                  ),
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),

                  const Text('¿Ha recogido ya su preparado?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor),
                  Text(cpi.preparation?.product ?? 'Todavía no lo he recogido', style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                  
                  Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                  Container(
                    color: Colors.white,
                    height: 1,
                  ),
                  Padding(padding: EdgeInsets.only(top: alto * 0.05)),


                ],
              ),
            )

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
                        const Text("Modificar", textScaleFactor: 1.2),
                      ],
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(left: ancho * 0.05)),

                Expanded(
                  child: CupertinoButton(
                    onPressed: () {
                      cpi.saveColonprepInfo();
                      Navigator.pushNamed(context, 'mainscreen', arguments: cpi);
                    },
                    color: Colors.green,
                    padding:
                        EdgeInsets.only(top: alto * 0.015, bottom: alto * 0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Terminar", textScaleFactor: 1.2),
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
