import 'dart:convert';

class ServerResponse {
    ServerResponse({
        required this.status,
        required this.message,
        required this.token,
        required this.location,
        required this.url,
    });

    int status;
    String message;
    String token;
    String location;
    String url;

    factory ServerResponse.fromJson(String str) => ServerResponse.fromMap(json.decode(str));

    factory ServerResponse.fromMap(Map<String, dynamic> json) => ServerResponse(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        location: json["location"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "token": token,
        "location": location,
        "url": url,
    };
}
