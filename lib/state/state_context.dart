import 'package:hospital/state/state.dart';
import 'package:hospital/state/sin_cita_state.dart';

class StateContext {
  static late State _currentState;

  StateContext() {
    _currentState = SinCitaState();
  }

  set state(State state) {
    _currentState = state;
  }

}