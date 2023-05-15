import 'dart:convert';

class Card {
    DateTime? timestamp;
    String? text;
    String? type;
    String? description;
    String? state;

    Card({
        this.timestamp,
        this.text,
        this.type,
        this.description,
        this.state,
    });

    factory Card.fromJson(String str) => Card.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Card.fromMap(Map<String, dynamic> json) => Card(
        timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
        text: json["text"],
        type: json["type"],
        description: json["description"],
        state: json["state"],
    );

    Map<String, dynamic> toMap() => {
        "timestamp": timestamp?.toIso8601String(),
        "text": text,
        "type": type,
        "description": description,
        "state": state,
    };
}
