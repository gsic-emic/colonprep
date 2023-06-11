import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/card.dart' as own;
import 'package:hospital/tools/tools.dart';

class ShowCard extends StatefulWidget {
  const ShowCard(
    this.card, {
    super.key,
    required this.ancho,
    required this.alto,
  });

  final own.Card card;
  final double ancho;
  final double alto;

  @override
  State<ShowCard> createState() => _ShowCardState();
}

class _ShowCardState extends State<ShowCard> {
  @override
  Widget build(BuildContext context) {

    //Estilo de tarjeta cuando el tipo es Info. Generalmente se usa para avisos de información general.
    if(widget.card.type == 'Info') {
      return Container(
        width: widget.ancho * 0.95,
        padding: EdgeInsets.only(top: widget.alto * 0.01, bottom: widget.alto * 0.01, left: widget.ancho * 0.04, right: widget.ancho * 0.04),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blueGrey,
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
                
                Padding(padding: EdgeInsets.symmetric(horizontal: widget.ancho * 0.01)),
                
                const Icon(Icons.info_outline_rounded),

              ],
            ),
          ],
        ),
      );
    }

    //Estilo de tarjeta cuando el tipo es ToDo. Se usa para avisos con los que el usuario debe interactuar.
    if(widget.card.type == 'ToDo') {
      return Container(
        width: widget.ancho * 0.95,
        padding: EdgeInsets.only(top: widget.alto * 0.01, bottom: widget.alto * 0.01, left: widget.ancho * 0.04, right: widget.ancho * 0.04),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.orange,
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
                
                Padding(padding: EdgeInsets.symmetric(horizontal: widget.ancho * 0.01)),
                
                const Icon(Icons.info_outline_rounded),

              ],
            ),
          ],
        ),
      );
    }

    //Estilo de tarjeta cuando el tipo es Completed. Se usa para avisos que ya han sido completados por parte del usuario.
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
                
                Padding(padding: EdgeInsets.symmetric(horizontal: widget.ancho * 0.01)),
                
                const Icon(Icons.info_outline_rounded),

              ],
            ),
          ],
        ),
      );
    }

    //Estilo de tarjeta cuando el tipo es Warning. Generalmente se usa para avisos que el usuario puede ocultar en cualquier momento.
    if(widget.card.type == 'Warning') {
      return Container(
        width: widget.ancho * 0.95,
        padding: EdgeInsets.only(top: widget.alto * 0.01, bottom: widget.alto * 0.01, left: widget.ancho * 0.04, right: widget.ancho * 0.04),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.orangeAccent,
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
                
                Padding(padding: EdgeInsets.symmetric(horizontal: widget.ancho * 0.01)),
                
                const Icon(Icons.info_outline_rounded),

              ],
            ),

            (widget.card.state == 'Pending')
              ? CupertinoButton(
                  onPressed: () {
                    widget.card.state = 'Hidden';
                    widget.card.type = 'Completed';
                    setState(() {
                      
                    });
                  },
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Ocultar',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                )
              : Container()
          ],
        ),
      );
    }

    return Container();

  }
}
