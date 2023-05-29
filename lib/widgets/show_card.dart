import 'package:flutter/material.dart';
import 'package:hospital/tools/tools.dart';

class ShowCard extends StatelessWidget {
  const ShowCard(this.datetime, this.text, this.type, this.description,  {
    super.key,
    required this.ancho,
    required this.alto,
  });

  final DateTime? datetime;
  final String text;
  final String type;
  final String? description;
  final double ancho;
  final double alto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ancho * 0.95,
      padding: EdgeInsets.only(top: alto * 0.01, bottom: alto * 0.01, left: ancho * 0.04, right: ancho * 0.04),
      decoration: BoxDecoration(
        border: Border.all(
          color: (type == 'Info') ? Colors.blueGrey : Colors.greenAccent,
          style: BorderStyle.solid,
          width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          (datetime != null) ? Text(
            Tools.formatDateWithoutTime(datetime as DateTime),
            textAlign: TextAlign.justify,
            style: const TextStyle(
                color: Colors.white),
          ) : Container(),
          Padding(padding: EdgeInsets.only(top: alto * 0.01)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (datetime != null && datetime?.hour != 0) ? Text(
                Tools.formatTimeWithoutDate(datetime as DateTime),
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    color: Colors.white),
              ) : Container(),
              (datetime != null && datetime?.hour != 0) ? Padding(padding: EdgeInsets.symmetric(horizontal: ancho * 0.01)) : Container(),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      color: Colors.white),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: ancho * 0.01)),
              (type == 'Info') ? const Icon(Icons.info_outline_rounded) : const Icon(Icons.check_rounded),
            ],
          ),
        ],
      ),
    );
  }
}