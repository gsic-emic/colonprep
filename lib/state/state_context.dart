import 'package:hospital/models/colonprep_info.dart';
import 'package:hospital/state/con_cita_listo_prep_state.dart';
import 'package:hospital/state/en_preparacion_state.dart';
import 'package:hospital/state/mala_preparacion_state.dart';
import 'package:hospital/state/preparacion_correcta_state.dart';
import 'package:hospital/state/state.dart';
import 'package:hospital/state/sin_cita_state.dart';

//Clase que maneja los estados
class StateContext {
  //Instancia del estado actual de la aplicación
  static State currentState = SinCitaState();

  //Establece un nuevo estado
  void setState(State state) {
    currentState = state;
  }

  //Establece la instancia con el estado actual de la aplicación
  Future<void> checkState() async {
    ColonprepInfo cpi = await ColonprepInfo.loadColonprepInfo();

    //DURANTE LA PREPARACIÓN
    if (cpi.preparation?.starting?.isBefore(DateTime.now()) == true) {
      setState(EnPreparacionState());
      return;
    }

    //ESTÁ COMPLETO EL FORMULARIO Y LISTO PARA EMPEZAR PREPARACIÓN
    if (cpi.patientQuestionnaire?.finished != null) {
      setState(ConCitaListoPrepState());
      return;
    }
    
    if (cpi.appointment?.dateTimeAppointment != null && cpi.appointment!.dateTimeAppointment!.isBefore(DateTime.now())) {
      //LA PREPARACIÓN SE HA COMPLETADO CORRECTAMENTE
      setState(PreparacionCorrectaState());
    } else if (false) {
      //RIESGO DE MALA PREPARACIÓN
    } else if (cpi.preparation?.intakeReports
            ?.any((intake) => intake.isTaken == false) ==
        true) {
      //LA PREPARACIÓN ES MALA
      setState(MalaPreparacionState());
    }
  }
}
