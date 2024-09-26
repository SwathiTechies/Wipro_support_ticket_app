// To parse this JSON data, do
//
//     final getCategoryModel = getCategoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel CategoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String CategoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  String? message;
  String? status;
  List<Datum>? data;

  CategoryModel({
    this.message,
    this.status,
    this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
  int? categoryId;
  String? categoryName;

  Datum({
    this.categoryId,
    this.categoryName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    categoryId: json["categoryId"],
    categoryName: json["categoryName"],
  );

  Map<String, dynamic> toJson() => {
    "categoryId": categoryId,
    "categoryName": categoryName,
  };
}
