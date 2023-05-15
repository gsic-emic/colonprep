import 'package:hospital/models/colonprep_info.dart';

class NotificationsManager {
  static void createNotifications(ColonprepInfo cpi) {
    // createPreviousNotifications(cpi);
    // createPreparationNotifications(cpi);
  }

  static void createPreviousNotifications(ColonprepInfo cpi) {
    
  }

  static void createPreparationNotifications(ColonprepInfo cpi) {
    if(cpi.preparation?.product == 'bohnCasenglicol') {

    } else if(cpi.preparation?.product == 'pleinvue') {

    } else if(cpi.preparation?.product == 'citrafleet') {

    } else if(cpi.preparation?.product == 'moviprep') {

    }
  }
}