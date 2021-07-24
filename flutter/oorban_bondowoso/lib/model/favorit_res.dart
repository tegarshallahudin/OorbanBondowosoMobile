// To parse this JSON data, do
//
//     final favoritRes = favoritResFromJson(jsonString);

import 'dart:convert';

FavoritRes favoritResFromJson(String str) => FavoritRes.fromJson(json.decode(str));

String favoritResToJson(FavoritRes data) => json.encode(data.toJson());

class FavoritRes {
    FavoritRes({
        required this.status,
        required this.message,
    });

    int status;
    String message;

    factory FavoritRes.fromJson(Map<String, dynamic> json) => FavoritRes(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
