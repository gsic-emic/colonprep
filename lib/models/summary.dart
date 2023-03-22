import 'dart:convert';

class Summary {
    Summary({
        required this.appId,
        required this.token,
        required this.dateTime,
        required this.isValidated,
        required this.validated,
        required this.created,
    });

    String appId;
    String token;
    DateTime dateTime;
    bool isValidated;
    DateTime validated;
    DateTime created;

    factory Summary.fromJson(String str) => Summary.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Summary.fromMap(Map<String, dynamic> json) => Summary(
        appId: json["appId"],
        token: json["token"],
        dateTime: DateTime.parse(json["dateTime"]),
        isValidated: json["isValidated"],
        validated: DateTime.parse(json["validated"]),
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toMap() => {
        "appId": appId,
        "token": token,
        "dateTime": dateTime.toIso8601String(),
        "isValidated": isValidated,
        "validated": validated.toIso8601String(),
        "created": created.toIso8601String(),
    };
}