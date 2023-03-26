import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital/screens/screens.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hospital/services/services.dart';
import 'package:timezone/data/latest.dart' as tz;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalSharedPreferences.configPrefs();
  LocalNotification().initNotification();
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      initialRoute: 'codescreen',
      routes: {
        //Pantalla para la introducción de la fecha de la prueba
        'datescreen'          : (context) => const DateScreen(),
        //Pantalla para la introducción del peso
        'weightscreen'        : (context) => const WeightScreen(),
        //Pantalla para la introducción de la altura
        'heightscreen'        : (context) => const HeightScreen(),
        //Pantalla para la introducción de las defecaciones
        'defecationscreen'    : (context) => const DefecationScreen(),
        //Pantalla para la introducción de la glucosa
        'glucosescreen'       : (context) => const GlucoseScreen(),
        //Pantalla para la introducción de parkinson
        'parkinsonscreen'     : (context) => const ParkinsonScreen(),
        //Pantalla para la introducción de operaciones
        'surgeryscreen'       : (context) => const SurgeryScreen(),
        //Pantalla para la introducción de medicamentos
        'medicinescreen'      : (context) => const MedicineScreen(),
        //Pantalla para la introducción de medicamentos relacionados con el sistema nervioso
        'nervoussystemscreen' : (context) => const NervousSystemScreen(),
        //Pantalla para la introducción de medicamentos para el control del dolor
        'painscreen'          : (context) => const PainScreen(),
        //Pantalla para la introducción de medicamentos para el control de la tensión arterial
        'bloodpressurescreen' : (context) => const BloodPressureScreen(),
        //Pantalla para la introducción de una colonoscopia previa
        'colonoscopyscreen'   : (context) => const ColonoscopyScreen(),
        //...
        'pruebas'             : (context) => const Pruebas(),
      },

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlue.shade400,
        unselectedWidgetColor: Colors.black,

        textTheme: Theme.of(context).textTheme.apply(
          fontSizeFactor: 1.4,
        ),

        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.only(right: 10),
        ),
      ),

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es')
      ],

    );
  }
}