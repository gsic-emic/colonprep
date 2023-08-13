import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital/screens/screens.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hospital/services/local_notification.dart';
import 'package:hospital/services/local_shared_preferences.dart';
import 'package:hospital/state/sin_cita_state.dart';
import 'package:hospital/state/state_context.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() async {
  //Garantiza que se inicialicen las partes fundamentales de la aplicación
  WidgetsFlutterBinding.ensureInitialized();
  //Singleton de las preferencias compartidas
  await LocalSharedPreferences.configPrefs();
  //Se configuran las notificaciones y se piden permisos al ususario
  LocalNotification().initNotification();
  //Configura la zona horaria
  tz.initializeTimeZones();
  //Se revisa el estado en el que se encuentra la aplicación cada vez que se inicia
  await StateContext().checkState();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Se bloquea la pantalla en formato vertical
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return MaterialApp(
      //Se deshabilita el banner con el mensaje de debug
      debugShowCheckedModeBanner: false,
      //Ruta a la que accede la aplicación cuando se inicia
      //TODO: debe depender del estado
      initialRoute: (StateContext.currentState is SinCitaState) ? 'initialscreen' : 'mainscreen',
      //Definición de todas las pantallas de la aplicación para poder generar las navegaciones de una forma más cómoda
      routes: {
        //Pantalla de inicio de la aplicación
        'initialscreen'             : (context) => const InitialScreen(),
        //Pantalla para la introducción de la fecha de la prueba
        'datescreen'                : (context) => const DateScreen(),
        //Pantalla para la introducción de la hora de la prueba
        'timescreen'                : (context) => const TimeScreen(),
        //Pantalla para la introducción del peso
        'weightscreen'              : (context) => const WeightScreen(),
        //Pantalla para la introducción de la altura
        'heightscreen'              : (context) => const HeightScreen(),
        //Pantalla para la introducción de las defecaciones
        'defecationscreen'          : (context) => const DefecationScreen(),
        //Pantalla para la introducción de la glucosa
        'glucosescreen'             : (context) => const GlucoseScreen(),
        //Pantalla para la introducción de parkinson
        'parkinsonscreen'           : (context) => const ParkinsonScreen(),
        //Pantalla para la introducción de cirugía bariátrica
        'bariatricsurgeryscreen'    : (context) => const BariatricSurgeryScreen(),
        //Pantalla para la introducción de operaciones del abdomen
        'abdominalsurgeryscreen'    : (context) => const AbdominalSurgeryScreen(),
        //Pantalla para el texto de los medicamentos
        'medicinesadvisoryscreen'   : (context) => const MedicinesAdvisoryScreen(),
        //Pantalla para la introducción de otros medicamentos
        'othermedicinesscreen'      : (context) => const OtherMedicinesScreen(),
        //Pantalla para la introducción de medicamentos relacionados con el sistema nervioso
        'nervoussystemscreen'       : (context) => const NervousSystemScreen(),
        //Pantalla para la introducción de medicamentos para el control del dolor
        'painscreen'                : (context) => const PainScreen(),
        //Pantalla para la introducción de medicamentos para el control de la tensión arterial
        'bloodpressurescreen'       : (context) => const BloodPressureScreen(),
        //Pantalla para la introducción de una colonoscopia previa
        'colonoscopyscreen'         : (context) => const ColonoscopyScreen(),
        //Pantalla para la introducción de la preparación
        'preparationscreen'         : (context) => const PreparationScreen(),
        //Pantalla para visualizar el resumen de los datos
        'summaryscreen'             : (context) => const SummaryScreen(),
        //Pantalla principal durante la preparación
        'mainscreen'                : (context) => const MainScreen(),
        //Pantalla principal para añadir la última deposición
        'adddefecationscreen'       : (context) => const AddDefecationScreen(),
        //Pantalla después de hacer click en una notificación
        'notificationscreen'        : (context) => const NotificationScreen(),
      },
      //Estilo global de la aplicación
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlue.shade400,
        unselectedWidgetColor: Colors.black,

        textTheme: Theme.of(context).textTheme.apply(
          fontSizeFactor: 1.4,
        ),

        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.only(right: 10),
        ),

        checkboxTheme: Theme.of(context).checkboxTheme.copyWith(
          fillColor: MaterialStateProperty.resolveWith((states) => Colors.white)
        ),
      ),
      //Configuración necesaria por los plugins de internacionalización y que requieren configuración de idiomas
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es')
      ],

    );
  }
}