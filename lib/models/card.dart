import 'dart:convert';

class Card {
    DateTime? timestamp;
    String? text;
    String? type;
    String? payload;
    String? state;

    Card({
        this.timestamp,
        this.text,
        this.type,
        this.payload,
        this.state,
    });

    factory Card.fromJson(String str) => Card.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Card.fromMap(Map<String, dynamic> json) => Card(
        timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
        text: json["text"],
        type: json["type"],
        payload: json["payload"],
        state: json["state"],
    );

    Map<String, dynamic> toMap() => {
        "timestamp": timestamp?.toIso8601String(),
        "text": text,
        "type": type,
        "payload": payload,
        "state": state,
    };
}
