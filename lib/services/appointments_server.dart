//Esta clase se utilizaría para conexión con el servidor
//Por el momento no se termina de implementar esta funcionalidad en la aplicación


// import 'dart:convert';
// import 'dart:io';
// import 'package:hospital/services/local_shared_preferences.dart';
// import 'package:hospital/tools/tools.dart';
// import 'package:http/http.dart' as http;

// class AppointmentsServer {
//   AppointmentsServer();

//   static const String _authority = 'colonprep.gsic.uva.es';
//   static const String _appointments = 'appointments';
//   static const String weight = 'weightKg';
//   static const String height = 'heightM';

//   static Future<bool> createAppointment(DateTime appointmentDate) async {

//     final Uri url = Uri.https(_authority, _appointments);
//     final Map<String, String> headers = {
//       "accept"        : "application/json",
//       "Content-Type"  : "application/json"
//     };
//     final Map <String, String> body = {'dateTime' : Tools.formatDateJSON(appointmentDate)};

//     var response = await http.post(
//       url,
//       headers: headers,
//       body: jsonEncode(body)
//     );

//     if (json.decode(response.body)['status'] == 201) {
//       final Map<String, dynamic> dec = json.decode(response.body);
//       LocalSharedPreferences.prefs.setString('appId', dec['location'].substring(14));
//       LocalSharedPreferences.prefs.setString('token', dec['token']);
//       print(response.body);
//       return true;
//     } else {
//       return false;
//     }
    
//   }

//   static Future<bool> getAppointment() async {
    
//     final String appId = LocalSharedPreferences.prefs.getString('appId') as String;
//     final String token = LocalSharedPreferences.prefs.getString('token') as String;
//     final Uri url = Uri.https(_authority, '$_appointments/$appId');
//     final Map<String, String> headers = {
//       "accept"        : "application/json",
//       "Authorization"  : "Bearer $token"
//     };

//     var response = await http.get(
//       url,
//       headers: headers
//     );

//     if (response.statusCode == 200) {
//       final File file = await FileProvider.getFile(FileProvider.appointmentFile);
//       file.writeAsString(response.body);
//       print(response.body);
//       return true;
//     } else {
//       return false;
//     }

//   }

//   static Future<bool> updateAppointment() async {
    
//     final String appId = LocalSharedPreferences.prefs.getString('appId') as String;
//     final String token = LocalSharedPreferences.prefs.getString('token') as String;
//     final Uri url = Uri.https(_authority, '$_appointments/$appId');
//     final Map<String, String> headers = {
//       "accept"        : "application/json",
//       "Authorization"  : "Bearer $token",
//       "Content-Type"  : "application/json"
//     };

//     final File file = await FileProvider.getFile(FileProvider.appointmentFile);

//     var response = await http.put(
//       url,
//       headers: headers,
//       body: await file.readAsString()
//     );

//     if (response.statusCode == 200) {
//       print(response.body);
//       return true;
//     } else {
//       return false;
//     }

//   }

//   static void changeQuestionnaireValue(String key, Object value) async {
//     final File file = await FileProvider.getFile(FileProvider.appointmentFile);
//     Map<String, dynamic> map = jsonDecode(file.readAsStringSync());
//     if (map.containsKey('questionnaire')) {
//       map['questionnaire'][key] = value;
//     } else {
//       map['questionnaire'] = {key : value};
//     }
//     final String temp = jsonEncode(map);
//     file.writeAsStringSync(temp);
//   }
// }