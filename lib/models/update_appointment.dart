import 'dart:convert';
import 'models.dart';

class UpdateAppointment {
    UpdateAppointment({
        required this.summary,
        required this.questionnaire,
    });

    Summary summary;
    Questionnaire questionnaire;

    factory UpdateAppointment.fromJson(String str) => UpdateAppointment.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UpdateAppointment.fromMap(Map<String, dynamic> json) => UpdateAppointment(
        summary: Summary.fromMap(json["summary"]),
        questionnaire: Questionnaire.fromMap(json["questionnaire"]),
    );

    Map<String, dynamic> toMap() => {
        "summary": summary.toMap(),
        "questionnaire": questionnaire.toMap(),
    };
}