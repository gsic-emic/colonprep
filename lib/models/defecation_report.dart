import 'dart:convert';

class DefecationReport {
    DefecationReport({
        this.dateTime,
        this.lastDefecation,
        this.defecationAspect,
    });

    DateTime? dateTime;
    bool? lastDefecation;
    String? defecationAspect;

    factory DefecationReport.fromJson(String str) => DefecationReport.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DefecationReport.fromMap(Map<String, dynamic> json) => DefecationReport(
        dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
        lastDefecation: json["lastDefecation"],
        defecationAspect: json["defecationAspect"],
    );

    Map<String, dynamic> toMap() => {
        "dateTime": dateTime?.toIso8601String(),
        "lastDefecation": lastDefecation,
        "defecationAspect": defecationAspect,
    };
}