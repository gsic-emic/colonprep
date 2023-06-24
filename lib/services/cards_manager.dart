import 'package:hospital/models/card.dart';
import 'package:hospital/models/cards.dart';
import 'package:hospital/models/colonprep_info.dart';

class CardsManager {

  //El usuario no ha interactuado
  static const String noAction = 'NoAction';
  //Respuesta esperada
  static const String correct = 'Correct';
  //Respuesta no esperada
  static const String incorrect = 'Incorrect';

  //Personaliza los colores de la tarjeta para tareas con importancia alta
  static const String toDo = 'ToDo';
  //Personaliza los colores de la tarjeta para tareas completadas
  static const String completed = 'Completed';
  

  static void createCards(ColonprepInfo cpi) async {
    DateTime dateTimeAppointment = cpi.appointment!.dateTimeAppointment!;
    Cards cards = await Cards.loadCards();
    cards.cards ??= [];

    createPreparationCards(cpi, cards, dateTimeAppointment);
    createIntensivePreparationCards(cpi, cards, dateTimeAppointment);
    createIronCards(cpi, cards, dateTimeAppointment);
    createDiabeticCards(cpi, cards, dateTimeAppointment);
    createOralAnticoagulantsCards(cpi, cards, dateTimeAppointment);
    createAntiplateletAgentsCards(cpi, cards, dateTimeAppointment);
    
    cards.saveCards();
  }

  //Método que comprueba la preparación que ha recogido el paciente y crea las tarjetas correspondientes
  static createPreparationCards(ColonprepInfo cpi, Cards cards, DateTime datetime) {
    //Comprobación de la preparación recogida
    if(cpi.preparation?.product == 'Bohn o Casenglicol') {
      createBohnCasenglicolCards(cpi, cards, datetime);
    } else if(cpi.preparation?.product == 'Pleinvue') {
      createPleinvueCards(cpi, cards, datetime);
    } else if(cpi.preparation?.product == 'CitraFleet') {
      createCitrafleetCards(cpi, cards, datetime);
    } else if(cpi.preparation?.product == 'Moviprep') {
      createMoviprepCards(cpi, cards, datetime);
    }
  }

  //Método que las tarjetas correspondientes a la preparación con solución de Bohn o Casenglicol
  static createBohnCasenglicolCards(ColonprepInfo cpi, Cards cards, DateTime datetime) {
    if(cpi.appointment?.appointmentShift == 'Morning') { //Solución de Bohn o Casenglicol - Turno de mañana
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 9, 0, 0),
        text: 'Recuerde que hoy a las 19 horas comienza la toma de la preparación Solución de Bohn o Casenglicol\nMañana deberá continuar a las ${datetime.hour-5} horas',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado el recordatorio del comienzo de la toma de Solución de Bohn o Casenglicol')
      );
      for (int i = 0; i <= 60; i += 15) {
        cards.cards!.add(Card(
          timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 19, 0, 0),
          text: 'Realice la toma de la preparación Solución de Bohn o Casenglicol de las 19:$i horas',
          type: toDo,
          state: noAction,
          payload: 'El paciente ha confirmado la toma de Solución de Bohn o Casenglicol programada a las 19:$i')
        );
      }
      for (int i = 0; i <= 60; i += 15) {
        cards.cards!.add(Card(
          timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 20, 0, 0),
          text: 'Realice la toma de la preparación Solución de Bohn o Casenglicol de las 20:$i horas',
          type: toDo,
          state: noAction,
          payload: 'El paciente ha confirmado la toma de Solución de Bohn o Casenglicol programada a las 20:$i')
        );
      }
      for (int i = 0; i <= 60; i += 15) {
        cards.cards!.add(Card(
          timestamp: DateTime(datetime.year, datetime.month, datetime.day, datetime.hour - 5, 0, 0),
          text: 'Realice la toma de la preparación Solución de Bohn o Casenglicol de las ${datetime.hour-5}:$i horas',
          type: toDo,
          state: noAction,
          payload: 'El paciente ha confirmado la toma de Solución de Bohn o Casenglicol programada a las ${datetime.hour-5}:$i')
        );
      }
      for (int i = 0; i <= 60; i += 15) {
        cards.cards!.add(Card(
          timestamp: DateTime(datetime.year, datetime.month, datetime.day, datetime.hour - 4, 0, 0),
          text: 'Realice la toma de la preparación Solución de Bohn o Casenglicol de las ${datetime.hour-4}:$i horas',
          type: toDo,
          state: noAction,
          payload: 'El paciente ha confirmado la toma de Solución de Bohn o Casenglicol programada a las ${datetime.hour-4}:$i')
        );
      }
    } else if(cpi.appointment?.appointmentShift == 'Afternoon') { //Solución de Bohn o Casenglicol - Turno de tarde
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 21, 0, 0),
        text: 'Recuerde que mañana a las 7 horas comienza la toma de la preparación Solución de Bohn o Casenglicol',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado el recordatorio del comienzo de la toma de Solución de Bohn o Casenglicol')
      );
      for (int i = 0; i <= 60; i += 15) {
        cards.cards!.add(Card(
          timestamp: DateTime(datetime.year, datetime.month, datetime.day, 7, 0, 0),
          text: 'Realice la toma de la preparación Solución de Bohn o Casenglicol de las 7:$i horas',
          type: toDo,
          state: noAction,
          payload: 'El paciente ha confirmado la toma de Solución de Bohn o Casenglicol programada a las 7:$i')
        );
      }
      for (int i = 0; i <= 60; i += 15) {
        cards.cards!.add(Card(
          timestamp: DateTime(datetime.year, datetime.month, datetime.day, 8, 0, 0),
          text: 'Realice la toma de la preparación Solución de Bohn o Casenglicol de las 8:$i horas',
          type: toDo,
          state: noAction,
          payload: 'El paciente ha confirmado la toma de Solución de Bohn o Casenglicol programada a las 8:$i')
        );
      }
      for (int i = 0; i <= 60; i += 15) {
        cards.cards!.add(Card(
          timestamp: DateTime(datetime.year, datetime.month, datetime.day, datetime.hour - 5, 0, 0),
          text: 'Realice la toma de la preparación Solución de Bohn o Casenglicol de las ${datetime.hour-5}:$i horas',
          type: toDo,
          state: noAction,
          payload: 'El paciente ha confirmado la toma de Solución de Bohn o Casenglicol programada a las ${datetime.hour-5}:$i')
        );
      }
      for (int i = 0; i <= 60; i += 15) {
        cards.cards!.add(Card(
          timestamp: DateTime(datetime.year, datetime.month, datetime.day, datetime.hour - 4, 0, 0),
          text: 'Realice la toma de la preparación Solución de Bohn o Casenglicol de las ${datetime.hour-4}:$i horas',
          type: toDo,
          state: noAction,
          payload: 'El paciente ha confirmado la toma de Solución de Bohn o Casenglicol programada a las ${datetime.hour-4}:$i')
        );
      }
    }
  }

  //Método que las tarjetas correspondientes a la preparación con Pleinvue
  static createPleinvueCards(ColonprepInfo cpi, Cards cards, DateTime datetime) {
    if(cpi.appointment?.appointmentShift == 'Morning') {
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 9, 0, 0),
        text: 'Recuerde que hoy a las 21 horas comienza la toma de la preparación Pleinvue\nMañana deberá continuar a las ${datetime.hour-5} horas',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado el recordatorio del comienzo de la toma de Pleinvue')
      );
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 21, 0, 0),
        text: 'Realice la toma de Pleinvue de las 21 horas a lo largo de 1 hora junto a medio litro de otros líquidos',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado la toma de Pleinvue programada a las 21')
      );
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day, datetime.hour - 5, 0, 0),
        text: 'Realice la toma de Pleinvue de las ${datetime.hour-5} horas a lo largo de 1 hora junto a medio litro de otros líquidos',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado la toma de Pleinvue programada a las ${datetime.hour-5}')
      );
    } else if(cpi.appointment?.appointmentShift == 'Afternoon') {
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 21, 0, 0),
        text: 'Recuerde que mañana a las 9 horas comienza la toma de la preparación Pleinvue',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado el recordatorio del comienzo de la toma de Pleinvue')
      );
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day, 9, 0, 0),
        text: 'Realice la toma de Pleinvue de las 9 horas a lo largo de 1 hora junto a medio litro de otros líquidos',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado la toma de Pleinvue programada a las 21')
      );
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day, datetime.hour - 5, 0, 0),
        text: 'Realice la toma de Pleinvue de las ${datetime.hour-5} horas a lo largo de 1 hora junto a medio litro de otros líquidos',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado la toma de Pleinvue programada a las ${datetime.hour-5}')
      );
    }
  }

  //Método que las tarjetas correspondientes a la preparación con Citrafleet
  static createCitrafleetCards(ColonprepInfo cpi, Cards cards, DateTime datetime) {
    if(cpi.appointment?.appointmentShift == 'Morning') {
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 9, 0, 0),
        text: 'Recuerde que hoy a las 19 horas comienza la toma de la preparación Citrafleet\nMañana deberá continuar a las ${datetime.hour-5} horas',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado el recordatorio del comienzo de la toma de Citrafleet')
      );
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 19, 0, 0),
        text: 'Realice la toma de Citrafleet de las 19 horas durante 10-15 minutos',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado la toma de Citrafleet programada a las 19')
      );
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 19, 10, 0),
        text: '10 minutos después de la toma de Citrafleet debe tomar 1,5 litros de agua o bebida isotónica',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado la toma de 1,5 litros de agua o bebida isotónica programada a las 19:10')
      );
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day, datetime.hour - 5, 0, 0),
        text: 'Realice la toma de Citrafleet de las ${datetime.hour-5} horas durante 10-15 minutos',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado la toma de Citrafleet programada a las ${datetime.hour-5}')
      );
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day, datetime.hour - 5, 10, 0),
        text: '10 minutos después de la toma de Citrafleet debe tomar 1,5 litros de agua o bebida isotónica',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado la toma de 1,5 litros de agua o bebida isotónica programada a las ${datetime.hour-5}:10')
      );
    } else if(cpi.appointment?.appointmentShift == 'Afternoon') {
      //TODO: NO HAY INFORMACIÓN DE ESTE CASO
    }
  }

  //Método que las tarjetas correspondientes a la preparación con Moviprep
  static createMoviprepCards(ColonprepInfo cpi, Cards cards, DateTime datetime) {
    if(cpi.appointment?.appointmentShift == 'Morning') {
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 9, 0, 0),
        text: 'Recuerde que hoy a las 20 horas comienza la toma de la preparación Moviprep\nMañana deberá continuar a las ${datetime.hour-5} horas',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado el recordatorio del comienzo de la toma de Moviprep')
      );
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 20, 0, 0),
        text: 'Realice la toma de Moviprep de las 20 horas y beba medio litro de líquidos',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado la toma de Moviprep programada a las 20')
      );
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day, datetime.hour - 5, 0, 0),
        text: 'Realice la toma de Moviprep de las ${datetime.hour-5} y beba medio litro de líquidos',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado la toma de Moviprep programada a las ${datetime.hour-5}')
      );
    } else if(cpi.appointment?.appointmentShift == 'Afternoon') {
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 21, 0, 0),
        text: 'Recuerde que mañana a las 8 horas comienza la toma de la preparación Moviprep',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado el recordatorio del comienzo de la toma de Moviprep')
      );
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day, 8, 0, 0),
        text: 'Realice la toma de Moviprep de las 8 horas y beba medio litro de líquidos',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado la toma de Moviprep programada a las 8')
      );
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day, datetime.hour - 5, 0, 0),
        text: 'Realice la toma de Moviprep de las ${datetime.hour-5} y beba medio litro de líquidos',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado la toma de Moviprep programada a las ${datetime.hour-5}')
      );
    }
  }

  //Método que comprueba si el paciente debe seguir una preparación intensiva y crea las tarjetas correspondientes
  static createIntensivePreparationCards(ColonprepInfo cpi, Cards cards, DateTime datetime) {
    //Se recuerda al paciente intensificar la preparación desde 5 días antes hasta 1 día antes de la cita
    if(isIntensivePreparation(cpi)) {
      int inicio = 5;
      int fin = 1;
      //Tomar al menos 2 litros de agua al día
      for (int i = fin; i <= inicio; i++) {
        cards.cards!.add(Card(
          timestamp: DateTime(datetime.year, datetime.month, datetime.day - i, 15, 0, 0),
          text: 'Recuerde tomar al menos 2 litros de agua al día',
          type: toDo,
          state: noAction,
          payload: 'El paciente ha confirmado la recomendación de tomar 2 litros de agua $i días antes de la cita')
        );
      }
      for (int i = fin; i <= inicio; i++) {
        cards.cards!.add(Card(
          timestamp: DateTime(datetime.year, datetime.month, datetime.day - i, 21, 0, 0),
          text: '¿Ha tomado al menos 2 litros de agua durante el día de hoy?',
          type: toDo,
          state: noAction,
          payload: 'El paciente ha confirmado tomar 2 litros de agua $i días antes de la cita')
        );
      }
      //24 horas antes tomar solamente líquidos
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, datetime.hour, 0, 0),
        text: 'Durante las próximas 24 horas, recuerde tomar solamente líquidos\nAdemás, tome 3 vasos de líquidos, sin burbujas ni azúcares, a mayores del preparado',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado tomar solo líquidos las últimas 24 horas antes de la cita')
      );
      //Tomar Evacuol dependiendo del turno de la cita
      inicio = 7;
      fin = 5;
      for (int i = fin; i <= inicio; i++) {
        cards.cards!.add(Card(
          timestamp: DateTime(datetime.year, datetime.month, datetime.day - i, 9, 0, 0),
          text: 'Recuerde comprar Evacuol\u00AE en su farmacia\nDebe comprarlo sin receta',
          type: toDo,
          state: noAction,
          payload: 'El paciente ha confirmado comprar Evacuol $i días antes de la cita')
        );
      }
      if(cpi.appointment?.appointmentShift == 'Morning') {
        inicio = 5;
        fin = 2;
        for (int i = fin; i <= inicio; i++) {
          cards.cards!.add(Card(
            timestamp: DateTime(datetime.year, datetime.month, datetime.day - i, 21, 0, 0),
            text: 'Recuerde tomar 6-8 gotas de Evacuol\u00AE',
            type: toDo,
            state: noAction,
            payload: 'El paciente ha confirmado tomar 6-8 gotas de Evacuol $i días antes de la cita')
          );
        }
      } else if(cpi.appointment?.appointmentShift == 'Afternoon') {
        inicio = 4;
        fin = 1;
        for (int i = fin; i <= inicio; i++) {
          cards.cards!.add(Card(
            timestamp: DateTime(datetime.year, datetime.month, datetime.day - i, 21, 0, 0),
            text: 'Recuerde tomar 6-8 gotas de Evacuol\u00AE',
            type: toDo,
            state: noAction,
            payload: 'El paciente ha confirmado tomar 6-8 gotas de Evacuol $i días antes de la cita')
          );
        }
      }
    }
  }

  //Método que comprueba si el paciente toma hierro y crea las tarjetas correspondientes
  static createIronCards(ColonprepInfo cpi, Cards cards, DateTime datetime) {
    //Se recuerda al paciente suspender el hierro desde 5 días antes hasta 1 día antes de la cita
    if(cpi.patientQuestionnaire!.medicines!.contains('Hierro')) {
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 5, 9, 0, 0),
        text: 'Recuerde suspender el tratamiento de hierro',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado suspender el hierro 5 días antes de la cita|Confirmar|')
      );
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 3, 9, 0, 0),
        text: '¿Ha recordado suspender el tratamiento de hierro?',
        type: toDo,
        state: noAction,
        payload: 'El paciente asegura suspender el hierro 3 días antes de la cita|SiNo|')
      );
    }
  }

  //Método que comprueba si el paciente es diabético y crea las tarjetas correspondientes
  static createDiabeticCards(ColonprepInfo cpi, Cards cards, DateTime datetime) {
    //Se recuerda al paciente contactar con MAP el día 5 antes de la cita
    if(cpi.patientQuestionnaire!.isDiabetic == true) {
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 5, 9, 0, 0),
        text: 'Contacte con su Médico de Atención Primaria y pregunte qué debe hacer siendo diabético',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado contacto con Médico de Atención Primaria por diabetes 5 días antes de la cita|Confirmar|')
      );
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 4, 9, 0, 0),
        text: '¿Ha contactado con su Médico de Atención Primaria para saber qué debe hacer siendo diabético?',
        type: toDo,
        state: noAction,
        payload: 'El paciente asegura contacto con Médico de Atención Primaria por diabetes 4 días antes de la cita|SiNo|')
      );
    }
  }

  //Método que comprueba si el paciente toma anticoagulantes orales y crea las tarjetas correspondientes
  static createOralAnticoagulantsCards(ColonprepInfo cpi, Cards cards, DateTime datetime) {
    //Se recuerda al paciente suspender los anticoagulantes orales desde 3 días antes hasta 1 días antes de la cita
    if(cpi.patientQuestionnaire!.medicines!.contains('Anticoagulantes orales')) {
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 5, 9, 0, 0),
        text: 'Contacte con su Médico de Atención Primaria para valorar la suspensión o sustición de Anticoagulantes Orales',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado el contacto con el Médico de Atención Primaria para suspender los anticoagulantes orales 5 días antes de la cita|Confirmar|')
      );
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 4, 9, 0, 0),
        text: '¿Ha contactado con su Médico de Atención Primaria para valorar la suspensión o sustición de Anticoagulantes Orales?',
        type: toDo,
        state: noAction,
        payload: 'El paciente asegura el contacto con el Médico de Atención Primaria para suspender los anticoagulantes orales 4 días antes de la cita|SiNo|')
      );
    }
  }

  //Método que comprueba si el paciente toma antiagregantes y crea las tarjetas correspondientes
  static createAntiplateletAgentsCards(ColonprepInfo cpi, Cards cards, DateTime datetime) {
    //Se recuerda al paciente suspender los antiagregantes desde 7 días antes hasta 1 días antes de la cita
    if(cpi.patientQuestionnaire!.medicines!.contains('Antiagregantes')) {
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 7, 9, 0, 0),
        text: 'Contacte con su Médico de Atención Primaria para valorar la suspensión o sustición de Antiagregantes',
        type: toDo,
        state: noAction,
        payload: 'El paciente ha confirmado el contacto con el Médico de Atención Primaria para suspender los antiagregantes orales 7 días antes de la cita|Confirmar|')
      );
      cards.cards!.add(Card(
        timestamp: DateTime(datetime.year, datetime.month, datetime.day - 5, 9, 0, 0),
        text: '¿Ha contactado con su Médico de Atención Primaria para valorar la suspensión o sustición de Antiagregantes?',
        type: toDo,
        state: noAction,
        payload: 'El paciente asegura el contacto con el Médico de Atención Primaria para suspender los antiagregantes orales 5 días antes de la cita|SiNo|')
      );
    }
  }

  //Método que comprueba si se debe hacer una preparación intensiva
  static bool isIntensivePreparation(ColonprepInfo cpi) {
    if (cpi.patientQuestionnaire?.constipation == true ||
        cpi.patientQuestionnaire?.isDiabetic == true ||
        cpi.patientQuestionnaire?.hasParkinson == true ||
        cpi.patientQuestionnaire?.hasAbdomenOrPelvisSurgery == true ||
        cpi.patientQuestionnaire?.medicines?.isNotEmpty == true ||
        cpi.patientQuestionnaire?.hasPreviousBadColonoscopy == true) {
      return true;
    } else {
      return false;
    }
  }
}
