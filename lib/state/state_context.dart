import 'package:hospital/models/colonprep_info.dart';
import 'package:hospital/state/con_cita_listo_prep_state.dart';
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

  Future<void> checkState() async {
    ColonprepInfo cpi;

    //NO EXISTE FICHERO, POR LO TANTO NO HAY CITA
    try {
      cpi = await ColonprepInfo.loadColonprepInfo();
    } catch (e) {
      setState(SinCitaState());
      return;
    }

    //DURANTE LA PREPARACIÓN
    if (cpi.preparation?.starting?.isBefore(DateTime.now()) == true) {
      setState(EnPreparacionState());
      return;
    }

    //ESTÁ COMPLETO EL FORMULARIO Y LISTO PARA EMPEZAR PREPARACIÓN
    if (cpi.preparationCollected == true && cpi.preparation?.product != null) {
      setState(ConCitaListoPrepState());
      return;
    }
    
    if (cpi.appointment!.dateTimeAppointment!.isBefore(DateTime.now())) {
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
