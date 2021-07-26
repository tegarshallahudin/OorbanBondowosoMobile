// To parse this JSON data, do
//
//     final lengkapiData = lengkapiDataFromJson(jsonString);

import 'dart:convert';

LengkapiData lengkapiDataFromJson(String str) => LengkapiData.fromJson(json.decode(str));

String lengkapiDataToJson(LengkapiData data) => json.encode(data.toJson());

class LengkapiData {
    LengkapiData({
        required this.status,
        required this.masssage,
        required this.data,
    });

    int status;
    String masssage;
    Data data;

    factory LengkapiData.fromJson(Map<String, dynamic> json) => LengkapiData(
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
        required this.updatedAt,
    });

    int id;
    String namaLengkap;
    String username;
    String password;
    String alamat;
    String nik;
    String noHp;
    String email;
    String gender;
    dynamic updatedAt;

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
        updatedAt: json["updated_at"],
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
        "updated_at": updatedAt,
    };
}
