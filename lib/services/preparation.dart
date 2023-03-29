import 'package:hospital/services/local_notification.dart';
import 'package:hospital/services/local_shared_preferences.dart';

class Preparation {
  Preparation();

  static void initPrep() {
    if (LocalSharedPreferences.prefs.getBool('medicine') ?? false) {
      LocalNotification().scheduledNotificationShow('ColonPrep', 'Recuerde que mañana empieza su preparación durante 6 días', 'init6dias');
    } else {
      LocalNotification().scheduledNotificationShow('ColonPrep', 'Recuerde que mañana empieza su preparación durante 4 días', 'initdias');
    }
  }

}