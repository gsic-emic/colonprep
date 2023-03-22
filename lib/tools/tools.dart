import 'package:intl/intl.dart';

class Tools {

  static String formatDateWithoutTime(DateTime date) {
    return DateFormat("dd - MM - yyyy").format(date);
  }

  static String formatDateJSON(DateTime date) {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(date);
  }
  
}
