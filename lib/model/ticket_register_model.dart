// To parse this JSON data, do
//
//     final ticketRegisterModel = ticketRegisterModelFromJson(jsonString);

import 'dart:convert';

TicketRegisterModel ticketRegisterModelFromJson(String str) => TicketRegisterModel.fromJson(json.decode(str));

String ticketRegisterModelToJson(TicketRegisterModel data) => json.encode(data.toJson());

class TicketRegisterModel {
  int? locationid;
  int? sublocationid;
  String? otherlocation;
  int? categoryId;
  int? subCategoryId;
  String? description;
  String? userADid;
  List<Image>? image;

  TicketRegisterModel({
    this.locationid,
    this.sublocationid,
    this.otherlocation,
    this.categoryId,
    this.subCategoryId,
    this.description,
    this.userADid,
    this.image,
  });

  factory TicketRegisterModel.fromJson(Map<String, dynamic> json) => TicketRegisterModel(
    locationid: json["locationid"],
    sublocationid: json["sublocationid"],
    otherlocation: json["otherlocation"],
    categoryId: json["categoryId"],
    subCategoryId: json["subCategoryId"],
    description: json["description"],
    userADid: json["userADid"],
    image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "locationid": locationid,
    "sublocationid": sublocationid,
    "otherlocation": otherlocation,
    "categoryId": categoryId,
    "subCategoryId": subCategoryId,
    "description": description,
    "userADid": userADid,
    "image": List<dynamic>.from(image!.map((x) => x.toJson())),
  };
}

class Image {
  String? originalFileName;
  String? base64Image;

  Image({
    this.originalFileName,
    this.base64Image,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    originalFileName: json["OriginalFileName"],
    base64Image: json["Base64Image"],
  );

  Map<String, dynamic> toJson() => {
    "OriginalFileName": originalFileName,
    "Base64Image": base64Image,
  };
}
