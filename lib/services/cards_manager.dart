import 'package:hospital/models/card.dart';
import 'package:hospital/models/cards.dart';
import 'package:hospital/models/colonprep_info.dart';

class CardsManager {
  static void createCards(ColonprepInfo cpi) async {
    Cards cards = await Cards.loadCards();
    cards.cards ??= [];

    createCardsGeneral(cpi, cards);
    createCardsDay0(cpi, cards, cpi.appointment!.dateTimeAppointment!);
    createCardsDay1(cpi, cards, cpi.appointment!.dateTimeAppointment!);
    createCardsDay2(cpi, cards, cpi.appointment!.dateTimeAppointment!);
    createCardsDay3(cpi, cards, cpi.appointment!.dateTimeAppointment!);
    createCardsDay4(cpi, cards, cpi.appointment!.dateTimeAppointment!);
    createCardsDay5(cpi, cards, cpi.appointment!.dateTimeAppointment!);
    
    cards.saveCards();
  }

  static void createPreparationNotifications(ColonprepInfo cpi) {
    if (cpi.preparation?.product == 'bohnCasenglicol') {
    } else if (cpi.preparation?.product == 'pleinvue') {
    } else if (cpi.preparation?.product == 'citrafleet') {
    } else if (cpi.preparation?.product == 'moviprep') {}
  }

  static void createCardsGeneral(ColonprepInfo cpi, Cards cards) {
    if(cpi.patientQuestionnaire!.medicines!.contains('Hierro')) {
      cards.cards!.add(Card(timestamp: null, text: 'Recuerde suspender el tratamiento de hierro 5 días antes de la prueba', type: 'Info'));
    }
    if(cpi.patientQuestionnaire!.medicines!.contains('Anticoagulantes orales')) {
      cards.cards!.add(Card(timestamp: null, text: 'Contacte con su Médico de Atención Primaria para valorar la suspensión o sustitución de anticoagulantes orales. Habitualmente se tendrá que suspender 2-3 días antes de la prueba', type: 'Info'));
    }
    if(cpi.patientQuestionnaire!.medicines!.contains('Antiagregantes')) {
      cards.cards!.add(Card(timestamp: null, text: 'Contacte con su Médico de Atención Primaria para valorar la suspensión o sustitución de antiagregantes. Habitualmente se tendrá que suspender 5-7 días antes de la prueba', type: 'Info'));
    }
    if(cpi.patientQuestionnaire?.isDiabetic == true) {
      cards.cards!.add(Card(timestamp: null, text: 'Si es diabético contacte con su Médico de Atención Primaria', type: 'Info'));
    }
  }

  static void createCardsDay0(ColonprepInfo cpi, Cards cards, DateTime datetime) async {
    if(isIntensivePreparation(cpi)) {
      cards.cards!.add(Card(timestamp: datetime.subtract(const Duration(hours: 24)), text: 'Recuerda tomar únicamente líquidos claros y bebidas isotónicas (no carbonatadas ni con azúcares) hasta 2-3 horas antes de la prueba', type: 'Info'));
    }
  }

  static void createCardsDay1(ColonprepInfo cpi, Cards cards, DateTime datetime) async {
    if(isIntensivePreparation(cpi) && cpi.appointment?.appointmentShift == 'morning') {
      cards.cards!.add(Card(timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 0, 0, 0), text: 'Recuerda tomar al menos 2 litros de agua al día', type: 'Info'));
    } else if(isIntensivePreparation(cpi) && cpi.appointment?.appointmentShift == 'afternoon') {
      cards.cards!.add(Card(timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 0, 0, 0), text: 'Recuerda tomar al menos 2 litros de agua al día', type: 'Info'));
      cards.cards!.add(Card(timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 21, 0, 0), text: 'Recuerda tomar entre 6-8 gotas de Picosulfato de Sodio (Evacuol) por la noche', type: 'Action', state: 'Pending', description: 'Toma Evacuol día 2'));
    } else {
      cards.cards!.add(Card(timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 0, 0, 0), text: 'Recuerda tomar al menos 2 litros de agua al día', type: 'Info'));
    }
    cards.cards!.add(Card(timestamp: DateTime(datetime.year, datetime.month, datetime.day - 1, 0, 0, 0), text: 'Recuerda realizar dieta líquida, bebiendo al menos 2 litros', type: 'Info'));
  }

  static void createCardsDay2(ColonprepInfo cpi, Cards cards, DateTime datetime) async {
    if(isIntensivePreparation(cpi)) {
      cards.cards!.add(Card(timestamp: DateTime(datetime.year, datetime.month, datetime.day - 2, 0, 0, 0), text: 'Recuerda tomar al menos 2 litros de agua al día', type: 'Info'));
      cards.cards!.add(Card(timestamp: DateTime(datetime.year, datetime.month, datetime.day - 2, 21, 0, 0), text: 'Recuerda tomar entre 6-8 gotas de Picosulfato de Sodio (Evacuol) por la noche', type: 'Action', state: 'Pending', description: 'Toma Evacuol día 2'));
    } else {
      cards.cards!.add(Card(timestamp: DateTime(datetime.year, datetime.month, datetime.day - 2, 0, 0, 0), text: 'Recuerda tomar al menos 1.5-2 litros de agua al día', type: 'Info'));
    }
    cards.cards!.add(Card(timestamp: DateTime(datetime.year, datetime.month, datetime.day - 2, 0, 0, 0), text: 'Recuerda realizar dieta restringida pobre en residuos', type: 'Info'));
  }

  static void createCardsDay3(ColonprepInfo cpi, Cards cards, DateTime datetime) async {
    if(isIntensivePreparation(cpi)) {
      cards.cards!.add(Card(timestamp: DateTime(datetime.year, datetime.month, datetime.day - 3, 0, 0, 0), text: 'Recuerda tomar al menos 2 litros de agua al día', type: 'Info'));
      cards.cards!.add(Card(timestamp: DateTime(datetime.year, datetime.month, datetime.day - 3, 21, 0, 0), text: 'Recuerda tomar entre 6-8 gotas de Picosulfato de Sodio (Evacuol) por la noche', type: 'Action', state: 'Pending', description: 'Toma Evacuol día 3'));
    } else {
      cards.cards!.add(Card(timestamp: DateTime(datetime.year, datetime.month, datetime.day - 3, 0, 0, 0), text: 'Recuerda tomar al menos 1.5-2 litros de agua al día', type: 'Info'));
    }
    cards.cards!.add(Card(timestamp: DateTime(datetime.year, datetime.month, datetime.day - 3, 0, 0, 0), text: 'Recuerda realizar dieta restringida pobre en residuos', type: 'Info'));
  }

  static void createCardsDay4(ColonprepInfo cpi, Cards cards, DateTime datetime) async {
    if(isIntensivePreparation(cpi)) {
      cards.cards!.add(Card(timestamp: DateTime(datetime.year, datetime.month, datetime.day - 4, 0, 0, 0), text: 'Recuerda tomar al menos 2 litros de agua al día', type: 'Info'));
      cards.cards!.add(Card(timestamp: DateTime(datetime.year, datetime.month, datetime.day - 4, 21, 0, 0), text: 'Recuerda tomar entre 6-8 gotas de Picosulfato de Sodio (Evacuol) por la noche', type: 'Action', state: 'Pending', description: 'Toma Evacuol día 4'));
    }
  }
  
  static void createCardsDay5(ColonprepInfo cpi, Cards cards, DateTime datetime) async {
    if(isIntensivePreparation(cpi) && cpi.appointment?.appointmentShift == 'morning') {
      cards.cards!.add(Card(timestamp: DateTime(datetime.year, datetime.month, datetime.day - 5, 0, 0, 0), text: 'Recuerda tomar al menos 2 litros de agua al día', type: 'Info'));
      cards.cards!.add(Card(timestamp: DateTime(datetime.year, datetime.month, datetime.day - 5, 21, 0, 0), text: 'Recuerda tomar entre 6-8 gotas de Picosulfato de Sodio (Evacuol) por la noche', type: 'Action', state: 'Pending', description: 'Toma Evacuol día 5'));
    }
  }

  //PREPARACIÓN 5 DÍAS ANTES CON 2 LITROS DE AGUA, 24 HORAS ANTES SOLO LÍQUIDOS Y 3 VASOS DE LÍQUIDOS ADEMÁS DEL PREPARADO Y AÑADIR EVACUOL
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
