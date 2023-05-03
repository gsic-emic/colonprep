import 'package:hospital/models/appointment.dart';
import 'package:hospital/models/colonprep_info.dart';
import 'package:hospital/models/patient_questionnaire.dart';
import 'package:hospital/models/preparation.dart';
import 'package:intl/intl.dart';

class Tools {

  static ColonprepInfo initializeColonprepInfo() {
    ColonprepInfo cpi = ColonprepInfo();
    cpi.appointment = Appointment();
    cpi.patientQuestionnaire = PatientQuestionnaire();
    cpi.preparation = Preparation();
    return cpi;
  }

  static String formatDateWithoutTime(DateTime date) {
    return DateFormat("dd - MM - yyyy").format(date);
  }

  static String formatDate(DateTime date) {
    return DateFormat("dd - MM - yyyy   HH:mm").format(date);
  }
  
}
