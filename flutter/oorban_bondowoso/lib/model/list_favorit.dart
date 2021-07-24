// To parse this JSON data, do
//
//     final listFavorit = listFavoritFromJson(jsonString);

import 'dart:convert';

ListFavorit listFavoritFromJson(String str) => ListFavorit.fromJson(json.decode(str));

String listFavoritToJson(ListFavorit data) => json.encode(data.toJson());

class ListFavorit {
    ListFavorit({
        required this.status,
        required this.message,
        required this.data,
    });

    int status;
    String message;
    List<ListDataFavorit> data;

    factory ListFavorit.fromJson(Map<String, dynamic> json) => ListFavorit(
        status: json["status"],
        message: json["message"],
        data: List<ListDataFavorit>.from(json["data"].map((x) => ListDataFavorit.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ListDataFavorit {
    ListDataFavorit({
        required this.id,
        required this.idProperti,
        required this.idPenggunaAndroid,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    int idProperti;
    int idPenggunaAndroid;
    DateTime createdAt;
    DateTime updatedAt;

    factory ListDataFavorit.fromJson(Map<String, dynamic> json) => ListDataFavorit(
        id: json["id"],
        idProperti: json["id_properti"],
        idPenggunaAndroid: json["id_pengguna_android"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_properti": idProperti,
        "id_pengguna_android": idPenggunaAndroid,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}