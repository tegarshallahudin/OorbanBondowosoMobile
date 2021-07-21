// To parse this JSON data, do
//
//     final getLogin = getLoginFromJson(jsonString);

import 'dart:convert';

GetLogin getLoginFromJson(String str) => GetLogin.fromJson(json.decode(str));

String getLoginToJson(GetLogin data) => json.encode(data.toJson());

class GetLogin {
    GetLogin({
        required this.status,
        required this.masssage,
        required this.data,
    });

    int status;
    String masssage;
    Data data;

    factory GetLogin.fromJson(Map<String, dynamic> json) => GetLogin(
        status: json["status"],
        masssage: json["masssage"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "masssage": masssage,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.id,
        required this.namaLengkap,
        required this.username,
        required this.password,
        required this.alamat,
        required this.nik,
        required this.noHp,
        required this.email,
        required this.gender,
        required this.scanKtp,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String namaLengkap;
    String username;
    String password;
    dynamic alamat;
    dynamic nik;
    dynamic noHp;
    String email;
    String gender;
    dynamic scanKtp;
    DateTime createdAt;
    DateTime updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        namaLengkap: json["nama_lengkap"],
        username: json["username"],
        password: json["password"],
        alamat: json["alamat"],
        nik: json["nik"],
        noHp: json["no_hp"],
        email: json["email"],
        gender: json["gender"],
        scanKtp: json["scan_ktp"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_lengkap": namaLengkap,
        "username": username,
        "password": password,
        "alamat": alamat,
        "nik": nik,
        "no_hp": noHp,
        "email": email,
        "gender": gender,
        "scan_ktp": scanKtp,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
