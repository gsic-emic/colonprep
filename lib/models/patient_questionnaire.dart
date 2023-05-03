import 'dart:convert';

class PatientQuestionnaire {
    PatientQuestionnaire({
        this.started,
        this.finished,
        this.updated,
        this.heightCm,
        this.weightKg,
        this.constipation,
        this.isDiabetic,
        this.hasParkinson,
        this.hasAbdomenOrPelvisSurgery,
        this.hasBariatricSurgery,
        this.hasPreviousBadColonoscopy,
        this.medicines,
    });

    DateTime? started;
    DateTime? finished;
    DateTime? updated;
    int? heightCm;
    int? weightKg;
    bool? constipation;
    bool? isDiabetic;
    bool? hasParkinson;
    bool? hasAbdomenOrPelvisSurgery;
    bool? hasBariatricSurgery;
    bool? hasPreviousBadColonoscopy;
    List<String>? medicines;

    factory PatientQuestionnaire.fromJson(String str) => PatientQuestionnaire.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PatientQuestionnaire.fromMap(Map<String, dynamic> json) => PatientQuestionnaire(
        started: json["started"] == null ? null : DateTime.parse(json["started"]),
        finished: json["finished"] == null ? null : DateTime.parse(json["finished"]),
        updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
        heightCm: json["heightCm"],
        weightKg: json["weightKg"],
        constipation: json["constipation"],
        isDiabetic: json["isDiabetic"],
        hasParkinson: json["hasParkinson"],
        hasAbdomenOrPelvisSurgery: json["hasAbdomenOrPelvisSurgery"],
        hasBariatricSurgery: json["hasBariatricSurgery"],
        hasPreviousBadColonoscopy: json["hasPreviousBadColonoscopy"],
        medicines: json["medicines"] == null ? [] : List<String>.from(json["medicines"]!.map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "started": started?.toIso8601String(),
        "finished": finished?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "heightCm": heightCm,
        "weightKg": weightKg,
        "constipation": constipation,
        "isDiabetic": isDiabetic,
        "hasParkinson": hasParkinson,
        "hasAbdomenOrPelvisSurgery": hasAbdomenOrPelvisSurgery,
        "hasBariatricSurgery": hasBariatricSurgery,
        "hasPreviousBadColonoscopy": hasPreviousBadColonoscopy,
        "medicines": medicines == null ? [] : List<dynamic>.from(medicines!.map((x) => x)),
    };
}