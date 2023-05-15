import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';
import 'package:hospital/tools/tools.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DateScreen extends StatefulWidget {
  const DateScreen({super.key});

  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {

  final int minimimDays = 7;


  @override
  Widget build(BuildContext context) {

    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;

    ColonprepInfo cpi = ModalRoute.of(context)!.settings.arguments as ColonprepInfo;
    cpi.appointment?.dateTimeAppointment ??= DateTime.now().add(Duration(days: minimimDays));

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
        child: Column(
          children: [

            Padding(padding: EdgeInsets.only(top: alto * 0.1)),

            Text(
              AppLocalizations.of(context)!.colonoscopyDate,
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            Image.asset(
              "assets/images/calendar.png",
              width: double.infinity,
              height: ancho * 0.3,
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            const Text(
              "Selecciona la fecha de la colonoscopia:",
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
              child: CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.single,
                  selectedDayHighlightColor: Colors.black,
                  selectedDayTextStyle: const TextStyle(color: Colors.white),
                  weekdayLabelTextStyle: const TextStyle(color: Colors.white),
                  controlsTextStyle: const TextStyle(color: Colors.white),
                  dayTextStyle: const TextStyle(color: Colors.white),
                  lastMonthIcon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                  nextMonthIcon: const Icon(Icons.arrow_forward_rounded, color: Colors.white),
                  disableYearPicker: true,
                  selectableDayPredicate: (day) {
                    final now = DateTime.now();
                    final difference = day.difference(now).inDays;
                    return difference >= minimimDays - 1;
                  },
                  disabledDayTextStyle: const TextStyle(decoration: TextDecoration.lineThrough),
                ),
                initialValue: [
                  cpi.appointment?.dateTimeAppointment,
                ],
                onValueChanged: (value) {
                  cpi.appointment?.dateTimeAppointment = value.first;
                  setState(() {});
                },
              ),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            Text(
              Tools.formatDateWithoutTime(cpi.appointment?.dateTimeAppointment as DateTime ),
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

            LinearPercentIndicator(
              percent: 0.06,
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
                      Navigator.pushNamed(context, 'timescreen', arguments: cpi);
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
