import 'dart:convert';

class Questionnaire {
    Questionnaire({
        required this.heightM,
        required this.weightKg,
    });

    int heightM;
    int weightKg;

    factory Questionnaire.fromJson(String str) => Questionnaire.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Questionnaire.fromMap(Map<String, dynamic> json) => Questionnaire(
        heightM: json["heightM"],
        weightKg: json["weightKg"],
    );

    Map<String, dynamic> toMap() => {
        "heightM": heightM,
        "weightKg": weightKg,
    };
}