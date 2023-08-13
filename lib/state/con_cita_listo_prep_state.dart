import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/cards.dart';
import 'package:hospital/models/colonprep_info.dart';
import 'package:hospital/services/local_notification.dart';
import 'package:hospital/state/con_cita_pte_datos_state.dart';
import 'package:hospital/state/state.dart' as own;
import 'package:hospital/state/state_context.dart';
import 'package:hospital/tools/tools.dart';
import 'package:hospital/widgets/show_card.dart';

class ConCitaListoPrepState implements own.State {
  
  @override
  Widget loadMainScreen(BuildContext context, ColonprepInfo cpi, Cards cards, double ancho, double alto) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('ColonPrep'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: ancho * 0.04),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.remove_red_eye_outlined, color: Colors.blue),
                    title: const Text('Revisar Formulario'),
                    onTap: () => Navigator.pushNamed(context, 'summaryscreen', arguments: cpi),
                  ),
                  ListTile(
                    leading: const Icon(Icons.format_align_justify_rounded, color: Colors.blue),
                    title: const Text('Modificar Formulario'),
                    onTap: () {
                      Cards.removeCards();
                      cpi.resetColonprepInfo();
                      StateContext().setState(ConCitaPteDatosState());
                      Navigator.pushNamedAndRemoveUntil(context, 'datescreen', (route) => false, arguments: cpi);

                    },
                  ),
                  const ListTile(
                    leading: Icon(Icons.history_rounded, color: Colors.blue),
                    title: Text('Historial'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.cancel_outlined, color: Colors.blue),
                    title: const Text('Cancelar Preparación'),
                    onTap: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Text('Confirmación'),
                            content: const Text('Una vez cancelada la preparación, perderá todo el progreso'),
                            actions: [

                              CupertinoDialogAction(
                                child: const Text('Retroceder'),
                                onPressed: () => Navigator.pop(context)
                              ),

                              CupertinoDialogAction(
                                child: const Text('Cancelar'),
                                onPressed: () {
                                  LocalNotification().cancelNotifications();
                                  ColonprepInfo.removeColonprepInfo();
                                  Cards.removeCards();
                                  Navigator.pushNamedAndRemoveUntil(context, 'initialscreen', (route) => false);
                                },
                              ),

                            ],
                          );
                        }
                      );
                      
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.remove_red_eye_outlined, color: Colors.blue),
                    title: const Text('Revisar Formulario'),
                    onTap: () => Navigator.pushNamed(context, 'adddefecationscreen', arguments: cpi),
                  ),
                  Padding(padding: EdgeInsets.only(top: alto * 0.03)),
                  const Text('- Versión 1.0.0 -'),
                ],
              ),
            )
          ],
        )
      ),
      body: Container(
        margin: EdgeInsets.only(left: ancho * 0.03, right: ancho * 0.005),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(padding: EdgeInsets.only(top: alto * 0.02)),

            Text(
              "Su cita: ${Tools.formatDate(cpi.appointment?.dateTimeAppointment as DateTime )}",
              textAlign: TextAlign.center,
              textScaleFactor: 1.2,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.01)),

            (cards.cards!.any((card) => card.type == 'ToDo' && card.timestamp?.isBefore(DateTime.now()) == true)) ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.warning_amber_rounded, color: Colors.yellowAccent, size: 35,),
                Padding(padding: EdgeInsets.only(right: ancho * 0.01)),
                const Text(
                  "Acciones pendientes",
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ) : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_rounded, color: Colors.greenAccent, size: 35,),
                Padding(padding: EdgeInsets.only(right: ancho * 0.01)),
                const Text(
                  "Acciones completadas",
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.02)),
            
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
                      padding: EdgeInsets.only(right: ancho * 0.025),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                                            
                          //Muestra las tarjetas con estado Pending y cuyo instante de tiempo es anterior al presente
                          if(cards.cards![index].type == 'ToDo' && cards.cards![index].timestamp?.isBefore(DateTime.now()) == true) {
                            return Column(
                              children: [
                                ShowCard(
                                  cards.cards![index],
                                  cards: cards,
                                  cpi: cpi,
                                  ancho: ancho,
                                  alto: alto,
                                ),
                                (index == cards.cards!.length - 1) ? Padding(padding: EdgeInsets.only(top: alto * 0.05)) : Padding(padding: EdgeInsets.only(top: alto * 0.01)),
                              ],
                            );
                          } else {
                            return Container();
                          }
                                            
                        },
                        itemCount: cards.cards?.length,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
