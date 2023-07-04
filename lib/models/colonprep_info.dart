import 'dart:convert';
import 'dart:io';

import 'package:hospital/models/appointment.dart';
import 'package:hospital/models/log.dart';
import 'package:hospital/models/patient_questionnaire.dart';
import 'package:hospital/models/preparation.dart';
import 'package:hospital/services/local_file.dart';

class ColonprepInfo {
    ColonprepInfo({
        this.appointment,
        this.patientQuestionnaire,
        this.preparationCollected,
        this.preparation,
        this.log,
    }) {
      appointment ??= Appointment();
      patientQuestionnaire ??= PatientQuestionnaire();
      preparation ??= Preparation();
      log ?? List<Log>;
    }

    Appointment? appointment;
    PatientQuestionnaire? patientQuestionnaire;
    bool? preparationCollected;
    Preparation? preparation;
    List<Log>? log;

    factory ColonprepInfo.fromJson(String str) => ColonprepInfo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ColonprepInfo.fromMap(Map<String, dynamic> json) => ColonprepInfo(
        appointment: json["appointment"] == null ? null : Appointment.fromMap(json["appointment"]),
        patientQuestionnaire: json["patientQuestionnaire"] == null ? null : PatientQuestionnaire.fromMap(json["patientQuestionnaire"]),
        preparationCollected: json["preparationCollected"],
        preparation: json["preparation"] == null ? null : Preparation.fromMap(json["preparation"]),
        log: json["log"] == null ? [] : List<Log>.from(json["log"]!.map((x) => Log.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "appointment": appointment?.toMap(),
        "patientQuestionnaire": patientQuestionnaire?.toMap(),
        "preparationCollected": preparationCollected,
        "preparation": preparation?.toMap(),
        "log": log == null ? [] : List<dynamic>.from(log!.map((x) => x.toMap())),
    };

    static Future<ColonprepInfo> loadColonprepInfo() async {
      try {
        File file = await LocalFile.getFile(LocalFile.colonprepinfo);
        String leido = file.readAsStringSync();
        ColonprepInfo cpi = ColonprepInfo.fromJson(leido);
        return cpi;
      } on PathNotFoundException {
        return ColonprepInfo();
      }
    }

    void saveColonprepInfo() async {
      File file = await LocalFile.getFile(LocalFile.colonprepinfo);
      file.openWrite(mode: FileMode.write);
      file.writeAsStringSync(toJson());
    }

    static Future<void> removeColonprepInfo() async {
      File file = await LocalFile.getFile(LocalFile.colonprepinfo);
      if(await file.exists()) {
        await file.delete();
      }
    }

    void resetColonprepInfo() {
      preparation?.starting = null;
      patientQuestionnaire?.finished = null;
      appointment?.created = null;
      saveColonprepInfo();
    }
}
