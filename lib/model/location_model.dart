

import 'dart:convert';

LocationModel locationModelFromJson(String str) => LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  String? message;
  String? status;
  List<Datum>? data;

  LocationModel({
    this.message,
    this.status,
    this.data,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
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
  int? locationId;
  String? locationName;

  Datum({
    this.locationId,
    this.locationName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    locationId: json["locationId"],
    locationName: json["locationName"],
  );

  Map<String, dynamic> toJson() => {
    "locationId": locationId,
    "locationName": locationName,
  };
}
