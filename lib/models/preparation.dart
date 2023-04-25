import 'dart:convert';

import 'package:hospital/models/intake_report.dart';
import 'package:hospital/models/defecation_report.dart';

class Preparation {
    Preparation({
        this.product,
        this.starting,
        this.startingShift,
        this.intakeReports,
        this.defecationReports,
    });

    String? product;
    DateTime? starting;
    String? startingShift;
    List<IntakeReport>? intakeReports;
    List<DefecationReport>? defecationReports;

    factory Preparation.fromJson(String str) => Preparation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Preparation.fromMap(Map<String, dynamic> json) => Preparation(
        product: json["product"],
        starting: json["starting"] == null ? null : DateTime.parse(json["starting"]),
        startingShift: json["startingShift"],
        intakeReports: json["intakeReports"] == null ? [] : List<IntakeReport>.from(json["intakeReports"]!.map((x) => IntakeReport.fromMap(x))),
        defecationReports: json["defecationReports"] == null ? [] : List<DefecationReport>.from(json["defecationReports"]!.map((x) => DefecationReport.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "product": product,
        "starting": starting?.toIso8601String(),
        "startingShift": startingShift,
        "intakeReports": intakeReports == null ? [] : List<dynamic>.from(intakeReports!.map((x) => x.toMap())),
        "defecationReports": defecationReports == null ? [] : List<dynamic>.from(defecationReports!.map((x) => x.toMap())),
    };
}