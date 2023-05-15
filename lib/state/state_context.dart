import 'package:hospital/models/colonprep_info.dart';
import 'package:hospital/services/local_shared_preferences.dart';
import 'package:hospital/state/con_cita_listo_prep_state.dart';
import 'package:hospital/state/con_cita_pte_datos_state.dart';
import 'package:hospital/state/en_preparacion.dart';
import 'package:hospital/state/mala_preparacion.dart';
import 'package:hospital/state/preparacion_correcta.dart';
import 'package:hospital/state/state.dart';
import 'package:hospital/state/sin_cita_state.dart';

class StateContext {
  static late State currentState;

  void setState(State state) {
    currentState = state;
  }

  void checkState() async {
    //TODAVÍA NO EXISTE EL FICHERO
    if(!(LocalSharedPreferences.prefs.getBool('createdColonprepInfo') ?? false)) {
      setState(SinCitaState());
      return;
    }

    ColonprepInfo cpi = await ColonprepInfo.loadColonprepInfo();
    
    if (cpi.patientQuestionnaire?.started == null) {
      //NO HAY CITA
      setState(SinCitaState());
    } else if (cpi.patientQuestionnaire?.started != null &&
        (cpi.patientQuestionnaire?.heightCm == null ||
            cpi.patientQuestionnaire?.weightKg == null ||
            cpi.patientQuestionnaire?.constipation == null ||
            cpi.patientQuestionnaire?.isDiabetic == null ||
            cpi.patientQuestionnaire?.hasParkinson == null ||
            cpi.patientQuestionnaire?.hasAbdomenOrPelvisSurgery == null ||
            cpi.patientQuestionnaire?.hasBariatricSurgery == null ||
            cpi.patientQuestionnaire?.hasPreviousBadColonoscopy == null ||
            cpi.preparationCollected == null ||
            cpi.preparationCollected == false)) {
      //HAY CITA PERO NO SE HA COMPLETADO EL CUESTIONARIO
      setState(ConCitaPteDatosState());
    } else if (cpi.preparationCollected == true &&
        cpi.preparation?.starting?.isAfter(DateTime.now()) == true) {
      //CUESTIONARIO COMPLETADO Y LISTO PARA EMPEZAR PREPARACIÓN
      setState(ConCitaListoPrepState());
    } else if (cpi.preparation?.starting?.isBefore(DateTime.now()) == true) {
      //DURANTE LA PREPARACIÓN
      setState(EnPreparacionState());
    } else if (cpi.appointment!.dateTimeAppointment!.isBefore(DateTime.now())) {
      //LA PREPARACIÓN SE HA COMPLETADO CORRECTAMENTE
      setState(PreparacionCorrectaState());
    } else if(false) {
      //RIESGO DE MALA PREPARACIÓN

    } else if(cpi.preparation?.intakeReports?.any((intake) => intake.isTaken == false) == true) {
      //LA PREPARACIÓN ES MALA
      setState(MalaPreparacionState());
    }
  }
}
