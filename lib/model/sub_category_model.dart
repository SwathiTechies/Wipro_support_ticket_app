// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'dart:convert';

SubCategoryModel subCategoryModelFromJson(String str) => SubCategoryModel.fromJson(json.decode(str));

String subCategoryModelToJson(SubCategoryModel data) => json.encode(data.toJson());

class SubCategoryModel {
  String? message;
  String? status;
  List<Datum>? data;

  SubCategoryModel({
    this.message,
    this.status,
    this.data,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
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
  int? subCategoryId;
  String? subCategoryName;
  TicketPriority? ticketPriority;
  int? slaHours;
  int? slaDays;

  Datum({
    this.subCategoryId,
    this.subCategoryName,
    this.ticketPriority,
    this.slaHours,
    this.slaDays,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    subCategoryId: json["subCategoryId"],
    subCategoryName: json["subCategoryName"],
    ticketPriority: ticketPriorityValues.map[json["ticketPriority"]],
    slaHours: json["slaHours"],
    slaDays: json["slaDays"],
  );

  Map<String, dynamic> toJson() => {
    "subCategoryId": subCategoryId,
    "subCategoryName": subCategoryName,
    "ticketPriority": ticketPriorityValues.reverse[ticketPriority],
    "slaHours": slaHours,
    "slaDays": slaDays,
  };
}

enum TicketPriority {
  MEDIUM
}

final ticketPriorityValues = EnumValues({
  "Medium": TicketPriority.MEDIUM
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
