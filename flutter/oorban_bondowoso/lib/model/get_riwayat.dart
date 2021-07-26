// To parse this JSON data, do
//
//     final riwayatRes = riwayatResFromJson(jsonString);

import 'dart:convert';

RiwayatRes riwayatResFromJson(String str) => RiwayatRes.fromJson(json.decode(str));

String riwayatResToJson(RiwayatRes data) => json.encode(data.toJson());

class RiwayatRes {
    RiwayatRes({
        required this.status,
        required this.message,
        required this.data,
    });

    int status;
    String message;
    List<DataRiwayat> data;

    factory RiwayatRes.fromJson(Map<String, dynamic> json) => RiwayatRes(
        status: json["status"],
        message: json["message"],
        data: List<DataRiwayat>.from(json["data"].map((x) => DataRiwayat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataRiwayat {
    DataRiwayat({
        required this.idTransaksi,
        required this.kodeTransaksi,
        required this.idProperti,
        required this.idPenggunaAndroid,
        required this.usersId,
        required this.totalBayar,
        required this.userId,
        required this.name,
        required this.namaPemilik,
        required this.id,
        required this.username,
    });

    int idTransaksi;
    String kodeTransaksi;
    int idProperti;
    int idPenggunaAndroid;
    int usersId;
    int totalBayar;
    int userId;
    String name;
    String namaPemilik;
    int id;
    String username;

    factory DataRiwayat.fromJson(Map<String, dynamic> json) => DataRiwayat(
        idTransaksi: json["id_transaksi"],
        kodeTransaksi: json["kode_transaksi"],
        idProperti: json["id_properti"],
        idPenggunaAndroid: json["id_pengguna_android"],
        usersId: json["users_id"],
        totalBayar: json["total_bayar"],
        userId: json["user_id"],
        name: json["name"],
        namaPemilik: json["nama_pemilik"],
        id: json["id"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id_transaksi": idTransaksi,
        "kode_transaksi": kodeTransaksi,
        "id_properti": idProperti,
        "id_pengguna_android": idPenggunaAndroid,
        "users_id": usersId,
        "total_bayar": totalBayar,
        "user_id": userId,
        "name": name,
        "nama_pemilik": namaPemilik,
        "id": id,
        "username": username,
    };
}
