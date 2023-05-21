import 'package:intl/intl.dart';

class Tools {

  static String formatDateWithoutTime(DateTime date) {
    return DateFormat("dd - MM - yyyy").format(date);
  }

  static String formatTimeWithoutDate(DateTime date) {
    return DateFormat("HH:mm").format(date);
  }

  static String formatDate(DateTime date) {
    return DateFormat("dd - MM - yyyy   HH:mm").format(date);
  }
  
}
