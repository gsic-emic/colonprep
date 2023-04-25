import 'dart:convert';

class IntakeReport {
    IntakeReport({
        this.description,
        this.dateTime,
    });

    String? description;
    DateTime? dateTime;

    factory IntakeReport.fromJson(String str) => IntakeReport.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory IntakeReport.fromMap(Map<String, dynamic> json) => IntakeReport(
        description: json["description"],
        dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
    );

    Map<String, dynamic> toMap() => {
        "description": description,
        "dateTime": dateTime?.toIso8601String(),
    };
}