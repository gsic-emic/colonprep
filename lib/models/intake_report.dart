import 'dart:convert';

class IntakeReport {
    IntakeReport({
        this.description,
        this.isTaken,
        this.dateTime,
    });

    String? description;
    bool? isTaken;
    DateTime? dateTime;

    factory IntakeReport.fromJson(String str) => IntakeReport.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory IntakeReport.fromMap(Map<String, dynamic> json) => IntakeReport(
        description: json["description"],
        isTaken: json["isTaken"],
        dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
    );

    Map<String, dynamic> toMap() => {
        "description": description,
        "isTaken": isTaken,
        "dateTime": dateTime?.toIso8601String(),
    };
}