import 'dart:convert';

class Appointment {
    Appointment({
        this.dateTimeAppointment,
        this.appointmentShift,
        this.created,
    });

    DateTime? dateTimeAppointment;
    String? appointmentShift;
    DateTime? created;

    factory Appointment.fromJson(String str) => Appointment.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Appointment.fromMap(Map<String, dynamic> json) => Appointment(
        dateTimeAppointment: json["dateTimeAppointment"] == null ? null : DateTime.parse(json["dateTimeAppointment"]),
        appointmentShift: json["appointmentShift"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toMap() => {
        "dateTimeAppointment": dateTimeAppointment?.toIso8601String(),
        "appointmentShift": appointmentShift,
        "created": created?.toIso8601String(),
    };
}