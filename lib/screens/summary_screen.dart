import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';
import 'package:hospital/services/cards_manager.dart';
import 'package:hospital/state/con_cita_listo_prep_state.dart';
import 'package:hospital/state/con_cita_pte_datos_state.dart';
import 'package:hospital/state/state_context.dart';
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
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: EdgeInsets.only(right: ancho * 0.03),
                      child: Column(
                        children: [
                              
                          const Text(
                            "Compruebe que todos los datos introducidos son correctos:",
                            textAlign: TextAlign.justify,
                            style: TextStyle(color: Colors.white),
                            textScaleFactor: 1.1
                          ),
                    
                          Padding(padding: EdgeInsets.only(top: alto * 0.03)),
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
                    
                          const Text('¿Tiene menos de 3 deposiciones a la semana?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor, textAlign: TextAlign.center),
                          Text((cpi.patientQuestionnaire?.constipation == true) ? 'Sí': 'No', style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                    
                          Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                          Container(
                            color: Colors.white,
                            height: 1,
                          ),
                          Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                    
                          const Text('¿Toma medicinas para controlar la glucosa, es diabético?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor, textAlign: TextAlign.center),
                          Text((cpi.patientQuestionnaire?.isDiabetic == true) ? 'Sí': 'No', style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                    
                          Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                          Container(
                            color: Colors.white,
                            height: 1,
                          ),
                          Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                    
                          const Text('¿Está diagnosticado de enfermedad de Parkinson?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor, textAlign: TextAlign.center),
                          Text((cpi.patientQuestionnaire?.hasParkinson == true) ? 'Sí': 'No', style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                    
                          Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                          Container(
                            color: Colors.white,
                            height: 1,
                          ),
                          Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                    
                          const Text('¿Le han operado de cirugía bariátrica?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor, textAlign: TextAlign.center),
                          Text((cpi.patientQuestionnaire?.hasBariatricSurgery == true) ? 'Sí': 'No', style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                    
                          Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                          Container(
                            color: Colors.white,
                            height: 1,
                          ),
                          Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                    
                          const Text('¿Le han operado del abdomen o de la pelvis?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor, textAlign: TextAlign.center),
                          Text((cpi.patientQuestionnaire?.hasAbdomenOrPelvisSurgery == true) ? 'Sí': 'No', style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                    
                          Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                          Container(
                            color: Colors.white,
                            height: 1,
                          ),
                          Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                    
                          const Text('Medicaciones', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor),
                          Text((cpi.patientQuestionnaire?.medicines?.isNotEmpty ?? false) ? (cpi.patientQuestionnaire?.medicines?.where((element) => !['No otros', 'No nervioso', 'No dolor', 'No tension'].contains(element)).join(', ') ?? '') : ('No'), style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor, textAlign: TextAlign.center,),
                    
                          Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                          Container(
                            color: Colors.white,
                            height: 1,
                          ),
                          Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                    
                          const Text('¿Se ha realizado una colonoscopia previamente y no consiguió una adecuada limpieza del colon?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor, textAlign: TextAlign.center),
                          Text((cpi.patientQuestionnaire?.hasPreviousBadColonoscopy == true) ? 'Sí': 'No', style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                    
                          Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                          Container(
                            color: Colors.white,
                            height: 1,
                          ),
                          Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                    
                          const Text('Seleccione su preparado', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textScaleFactor: textScaleFactor),
                          Text(cpi.preparation?.product ?? '', style: const TextStyle(color: Colors.white), textScaleFactor: textScaleFactor),
                    
                          Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                          Container(
                            color: Colors.white,
                            height: 1,
                          ),
                          Padding(padding: EdgeInsets.only(top: alto * 0.05)),
                    
                        ],
                      ),
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
                        (StateContext.currentState is ConCitaPteDatosState) ? const Text("Modificar", textScaleFactor: 1.2) : const Text("Volver", textScaleFactor: 1.2),
                      ],
                    ),
                  ),
                ),

                (StateContext.currentState is ConCitaPteDatosState) ? Padding(padding: EdgeInsets.only(left: ancho * 0.05)) : Container(),

                (StateContext.currentState is ConCitaPteDatosState) ? Expanded(
                  child: CupertinoButton(
                    onPressed: () {
                      // cpi.saveColonprepInfo();
                      // StateContext().setState(ConCitaListoPrepState());
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Text('Confirmación'),
                            content: const Text('Una vez completado el formulario, no podrás modificar los datos introducidos'),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text('Retroceder'),
                                onPressed: () => Navigator.pop(context)
                              ),
                              CupertinoDialogAction(
                                child: const Text('Terminar'),
                                onPressed: () async {
                                  (cpi.patientQuestionnaire?.finished == null) ? cpi.patientQuestionnaire?.finished = DateTime.now() : cpi.patientQuestionnaire?.updated = DateTime.now();
                                  StateContext().setState(ConCitaListoPrepState());
                                  cpi.saveColonprepInfo();
                                  CardsManager.createCards(cpi);
                                  Navigator.pushNamedAndRemoveUntil(context, 'mainscreen', (route) => false);
                                },
                              ),
                            ],
                          );
                        }
                      );
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
