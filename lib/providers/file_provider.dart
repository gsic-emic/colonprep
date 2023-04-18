import 'dart:convert';
import 'dart:io';
import 'package:hospital/services/local_shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

class FileProvider{

  static const String appointmentFile = 'appointment.json';
  static const String preformattedDataFile = 'assets/files/preformattedData.json';
  static const String appointment = 'appointment';
  static const String patientQuestionnaire = 'patientQuestionnaire';
  static const String preparation = 'preparation';

  FileProvider();

  static Future<String> get _path async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  static Future<File> getFile(String file) async {
    final path = await _path;
    return File('$path/$file');
  }

  static Future<void> preformatDataFile() async {
    bool preformatted = LocalSharedPreferences.prefs.getBool('preformattedDataFile') ?? false;
    if(!preformatted) {
      String str = await rootBundle.loadString(preformattedDataFile);
      File file = await getFile(appointmentFile);
      file.writeAsStringSync(str);
      LocalSharedPreferences.prefs.setBool('preformattedDataFile', true);
    }
  }

  //Obtiene los datos del fichero appointmentFile y los devuelve en un mapa
  static Future<Map<String, dynamic>> getData() async {
    File file = await getFile(appointmentFile);
    String str = await file.readAsString();
    return json.decode(str);
  }

  //Escribe en el fichero appointmentFile el mapa como argumento
  static Future<void> setData(Map<String, dynamic> data) async {
    File file = await getFile(appointmentFile);
    String str = json.encode(data);
    file.writeAsStringSync(str);
  }

  //Devuelve el valor solicitado de los objetos de más alto nivel de appointmentFile
  static Future<dynamic> getFromData(String object, String key) async {
    Map<String, dynamic> data = await getData();
    if(data.containsKey(object) && data[object].containsKey(key)) {
      return data[object][key];
    } else {
      return null;
    }
  }

  //Modifica o crea un nuevo valor en el mapa de datos
  static Future<void> addToData(String object, String key, dynamic value) async {
    Map<String, dynamic> data = await getData();
    data[object][key] ??= value;
    setData(data);
  }

}