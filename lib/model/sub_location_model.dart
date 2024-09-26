// To parse this JSON data, do
//
//     final subLocationModel = subLocationModelFromJson(jsonString);

import 'dart:convert';

SubLocationModel subLocationModelFromJson(String str) => SubLocationModel.fromJson(json.decode(str));

String subLocationModelToJson(SubLocationModel data) => json.encode(data.toJson());

class SubLocationModel {
  String? message;
  String? status;
  List<Datum>? data;

  SubLocationModel({
    this.message,
    this.status,
    this.data,
  });

  factory SubLocationModel.fromJson(Map<String, dynamic> json) => SubLocationModel(
    message: json["Message"],
    status: json["Status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Message": message,
    "Status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? sublocationid;
  String? sublocationname;

  Datum({
    this.sublocationid,
    this.sublocationname,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    sublocationid: json["sublocationid"],
    sublocationname: json["sublocationname"],
  );

  Map<String, dynamic> toJson() => {
    "sublocationid": sublocationid,
    "sublocationname": sublocationname,
  };
}
