import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';
import 'package:hospital/tools/tools.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key});

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {

  //Hora a la que se realiza el corte entre turno de mañana y de tarde
  final int shiftHandover = 15;

  @override
  Widget build(BuildContext context) {

    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;

    ColonprepInfo cpi = ModalRoute.of(context)!.settings.arguments as ColonprepInfo;

    DateTime initialDateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 0);

    if (cpi.appointment?.dateTimeAppointment != null && cpi.appointment!.dateTimeAppointment!.isAfter(initialDateTime)) {
      initialDateTime = cpi.appointment!.dateTimeAppointment!;
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
        child: Column(
          children: [

            Padding(padding: EdgeInsets.only(top: alto * 0.07)),

            const Text(
              "- Pregunta 2 de 15 -",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.01)),

            const Text(
              'HORA COLONOSCOPIA',
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            Image.asset(
              "assets/images/calendar.png",
              width: double.infinity,
              height: ancho * 0.2,
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            const Text(
              "Selecciona la hora de la colonoscopia:",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                height: alto * 0.3,
                child: CupertinoTheme(
                  data: const CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(color: Colors.white),
                    )
                  ),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: true,
                    // initialDateTime: cpi.appointment?.dateTimeAppointment,
                    initialDateTime: initialDateTime,
                    onDateTimeChanged: (value) {
                      cpi.appointment?.dateTimeAppointment = value;
                      if((cpi.appointment?.dateTimeAppointment?.hour ?? 0) < shiftHandover) {
                        cpi.appointment?.appointmentShift = 'Morning';
                      } else {
                        cpi.appointment?.appointmentShift = 'Afternoon';
                      }
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            Text(
              Tools.formatDate(cpi.appointment?.dateTimeAppointment as DateTime ),
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                    padding: EdgeInsets.only(top: alto * 0.015, bottom: alto * 0.015),
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
                      Navigator.pushNamed(context, 'weightscreen', arguments: cpi);
                    },
                    color: Colors.green,
                    padding: EdgeInsets.only(top: alto * 0.015, bottom: alto * 0.015),
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
