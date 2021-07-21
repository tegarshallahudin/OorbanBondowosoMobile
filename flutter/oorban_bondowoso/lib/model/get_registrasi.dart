// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
    Register({
        required this.status,
        required this.masssage,
    });

    int status;
    String masssage;

    factory Register.fromJson(Map<String, dynamic> json) => Register(
        status: json["status"],
        masssage: json["masssage"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "masssage": masssage,
    };
}
