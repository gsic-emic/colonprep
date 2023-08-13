import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/card.dart' as own;
import 'package:hospital/models/cards.dart';
import 'package:hospital/models/colonprep_info.dart';
import 'package:hospital/models/log.dart';
import 'package:hospital/services/cards_manager.dart';
import 'package:hospital/tools/tools.dart';

class ShowCard extends StatefulWidget {
  const ShowCard(
    this.card, {
    super.key,
    required this.cards,
    required this.cpi,
    required this.ancho,
    required this.alto,
  });

  final own.Card card;
  final Cards cards;
  final ColonprepInfo cpi;
  final double ancho;
  final double alto;

  @override
  State<ShowCard> createState() => _ShowCardState();
}

class _ShowCardState extends State<ShowCard> {
  String getCardDescription(String? payload) {
    if (payload != null) {
      List<String> payloadParts = payload.split('|');
      return payloadParts[0];
    }
    return 'No Description';
  }

  bool isSiNoInteraction(String? payload) {
    if (payload != null) {
      List<String> payloadParts = payload.split('|');
      return payloadParts.length > 1 && payloadParts[1] == 'SiNo';
    }
    return false;
  }

  bool isConfirmarInteraction(String? payload) {
    if (payload != null) {
      List<String> payloadParts = payload.split('|');
      return payloadParts.length > 1 && payloadParts[1] == 'Confirmar';
    }
    return false;
  }

  //Se construyen diferentes tipos de tarjetas dependiendo de los campos completados en cada una de ellas
  @override
  Widget build(BuildContext context) {

    //Estilo de tarjeta cuando el tipo es ToDo. Se usa para avisos con los que el usuario debe interactuar
    if(widget.card.type == 'ToDo') {
      return Container(
        width: widget.ancho * 0.95,
        padding: EdgeInsets.only(top: widget.alto * 0.01, bottom: widget.alto * 0.01, left: widget.ancho * 0.04, right: widget.ancho * 0.04),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.redAccent,
            style: BorderStyle.solid,
            width: 2
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [

            (widget.card.timestamp == null)
              ? Container()
              : Text(
                  Tools.formatDateWithoutTime(widget.card.timestamp as DateTime),
                  textAlign: TextAlign.justify,
                  style: const TextStyle(color: Colors.white),
                ),
            
            (widget.card.timestamp == null)
              ? Container()
              : Padding(padding: EdgeInsets.only(top: widget.alto * 0.01)),
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                (widget.card.timestamp == null || widget.card.timestamp?.hour == 0)
                  ? Container()
                  : Text(
                      Tools.formatTimeWithoutDate(widget.card.timestamp as DateTime),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.white),
                    ),
                
                (widget.card.timestamp == null || widget.card.timestamp?.hour == 0)
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: widget.ancho * 0.01)),
                
                Expanded(
                  child: Text(
                    widget.card.text!,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //Botón que se dibuja para confirmar una acción de Sí o No
                (isSiNoInteraction(widget.card.payload))
                  ? TextButton(
                      onPressed: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: const Text('Confirmación'),
                              content: Text(widget.card.text ?? ''),
                              actions: [
                                CupertinoDialogAction(
                                  child: const Text('No'),
                                  onPressed: () {
                                    widget.cpi.log!.add(
                                      Log(
                                        timestamp: DateTime.now(),
                                        messageType: 'Info',
                                        description: '${getCardDescription(widget.card.payload)} > NO'
                                      )
                                    );
                                    widget.card.type = CardsManager.completed;
                                    widget.card.state = CardsManager.incorrect;
                                    widget.cards.saveCards();
                                    widget.cpi.saveColonprepInfo();
                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: const Text('Sí'),
                                  onPressed: () {
                                    widget.cpi.log!.add(
                                      Log(
                                        timestamp: DateTime.now(),
                                        messageType: 'Info',
                                        description: '${getCardDescription(widget.card.payload)} > SI'
                                      )
                                    );
                                    widget.card.type = CardsManager.completed;
                                    widget.card.state = CardsManager.correct;
                                    widget.cards.saveCards();
                                    widget.cpi.saveColonprepInfo();
                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                ),
                              ],
                            );
                          }
                        );
                      },
                      child: const Text('Responder', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                    )
                  : Container(),

                //Botón que se dibuja para confirmar una acción de Sí o No
                (isConfirmarInteraction(widget.card.payload))
                  ? TextButton(
                      onPressed: () {
                        widget.cpi.log!.add(
                          Log(
                            timestamp: DateTime.now(),
                            messageType: 'Info',
                            description: getCardDescription(widget.card.payload)
                          )
                        );
                        widget.card.type = CardsManager.completed;
                        widget.card.state = CardsManager.correct;
                        widget.cards.saveCards();
                        widget.cpi.saveColonprepInfo();
                        setState(() {});
                      },
                      child: const Text('Confirmar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                    )
                  : Container()

              ],
            ),

          ],
        ),
      );
    }

    //Estilo de tarjeta cuando el tipo es Completed. Se usa para avisos que ya han sido completados por parte del usuario
    if(widget.card.type == 'Completed') {
      return Container(
        width: widget.ancho * 0.95,
        padding: EdgeInsets.only(top: widget.alto * 0.01, bottom: widget.alto * 0.01, left: widget.ancho * 0.04, right: widget.ancho * 0.04),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.greenAccent,
            style: BorderStyle.solid,
            width: 2
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [

            (widget.card.timestamp == null)
              ? Container()
              : Text(
                  Tools.formatDateWithoutTime(widget.card.timestamp as DateTime),
                  textAlign: TextAlign.justify,
                  style: const TextStyle(color: Colors.white),
                ),
            
            (widget.card.timestamp == null)
              ? Container()
              : Padding(padding: EdgeInsets.only(top: widget.alto * 0.01)),
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                (widget.card.timestamp == null || widget.card.timestamp?.hour == 0)
                  ? Container()
                  : Text(
                      Tools.formatTimeWithoutDate(widget.card.timestamp as DateTime),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.white),
                    ),
                
                (widget.card.timestamp == null || widget.card.timestamp?.hour == 0)
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: widget.ancho * 0.01)),
                
                Expanded(
                  child: Text(
                    widget.card.text!,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),

              ],
            ),
          ],
        ),
      );
    }

    return Container();

  }
}
