import 'dart:convert';

class Log {
    Log({
        this.timestamp,
        this.messageType,
        this.description,
    });

    DateTime? timestamp;
    String? messageType;
    String? description;

    factory Log.fromJson(String str) => Log.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Log.fromMap(Map<String, dynamic> json) => Log(
        timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
        messageType: json["messageType"],
        description: json["description"],
    );

    Map<String, dynamic> toMap() => {
        "timestamp": timestamp?.toIso8601String(),
        "messageType": messageType,
        "description": description,
    };
}