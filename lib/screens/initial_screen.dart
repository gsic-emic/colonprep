import 'package:flutter/material.dart';
import 'package:hospital/models/colonprep_info.dart';
import 'package:hospital/services/local_shared_preferences.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  late ColonprepInfo cpi;

  @override
  void initState() {
    super.initState();
    bool createdColonprepInfo = LocalSharedPreferences.prefs.getBool('createdColonprepInfo') ?? false;
    if(createdColonprepInfo) {
      loadColonprepInfo();
    } else {
      cpi = ColonprepInfo();
    }
  }

  loadColonprepInfo() async {
    cpi = await ColonprepInfo.loadColonprepInfo();
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

            Padding(padding: EdgeInsets.only(top: alto * 0.15)),

            const Text(
              'COLONPREP',
              textAlign: TextAlign.center,
              textScaleFactor: 1.6,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.07)),

            Image.asset(
              "assets/images/intestine.png",
              width: double.infinity,
              height: ancho * 0.5,
            ),

            const Expanded(child: Text('')),

            ElevatedButton(
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.white),
                minimumSize: MaterialStateProperty.all(Size(ancho * 0.8, alto * 0.06)),
                backgroundColor: MaterialStateProperty.all(Colors.lightBlue.shade400),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white, width: 2)
                  )
                )
              ),
              onPressed: () {
                cpi.patientQuestionnaire?.started = DateTime.now();
                Navigator.pushNamed(context, 'datescreen', arguments: cpi);
              },
              child: Text('Empezar preparación'.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.01)),

            TextButton(
              onPressed: (){
                ColonprepInfo.removeColonprepInfo();
              },
              child: const Text(
                'Información general',
                style: TextStyle(color: Colors.white)
              )
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.1)),

          ],
        ),
      ),
    );
  }
}
