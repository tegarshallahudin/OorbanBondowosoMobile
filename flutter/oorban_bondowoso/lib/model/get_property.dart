// To parse this JSON data, do
//
//     final property = propertyFromJson(jsonString);

import 'dart:convert';

Property propertyFromJson(String str) => Property.fromJson(json.decode(str));

String propertyToJson(Property data) => json.encode(data.toJson());

class Property {
    Property({
        required this.status,
        required this.message,
        required this.data,
    });

    int status;
    String message;
    List<DataProperty> data;

    factory Property.fromJson(Map<String, dynamic> json) => Property(
        status: json["status"],
        message: json["message"],
        data: List<DataProperty>.from(json["data"].map((x) => DataProperty.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataProperty {
    DataProperty({
        required this.id,
        required this.namaPemilik,
        required this.umurBangunan,
        required this.harga,
        required this.jmlKamartidur,
        required this.jmlKamarmandi,
        required this.luasTanah,
        required this.luasBangunan,
        required this.lantai,
        required this.dayaListrik,
        required this.tahunDibangun,
        required this.keterangan,
        required this.gambar,
        required this.sertifikat,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String namaPemilik;
    int umurBangunan;
    String harga;
    int jmlKamartidur;
    int jmlKamarmandi;
    int luasTanah;
    int luasBangunan;
    int lantai;
    int dayaListrik;
    int tahunDibangun;
    String keterangan;
    String gambar;
    String sertifikat;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    factory DataProperty.fromJson(Map<String, dynamic> json) => DataProperty(
        id: json["id"],
        namaPemilik: json["nama_pemilik"],
        umurBangunan: json["umur_bangunan"],
        harga: json["harga"],
        jmlKamartidur: json["jml_kamartidur"],
        jmlKamarmandi: json["jml_kamarmandi"],
        luasTanah: json["luas_tanah"],
        luasBangunan: json["luas_bangunan"],
        lantai: json["lantai"],
        dayaListrik: json["daya_listrik"],
        tahunDibangun: json["tahun_dibangun"],
        keterangan: json["keterangan"],
        gambar: json["gambar"],
        sertifikat: json["sertifikat"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_pemilik": namaPemilik,
        "umur_bangunan": umurBangunan,
        "harga": harga,
        "jml_kamartidur": jmlKamartidur,
        "jml_kamarmandi": jmlKamarmandi,
        "luas_tanah": luasTanah,
        "luas_bangunan": luasBangunan,
        "lantai": lantai,
        "daya_listrik": dayaListrik,
        "tahun_dibangun": tahunDibangun,
        "keterangan": keterangan,
        "gambar": gambar,
        "sertifikat": sertifikat,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
