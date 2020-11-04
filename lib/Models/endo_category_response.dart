// To parse this JSON data, do
//
//     final endoCategoryResponse = endoCategoryResponseFromJson(jsonString);

import 'dart:convert';

EndoCategoryResponse endoCategoryResponseFromJson(String str) => EndoCategoryResponse.fromJson(json.decode(str));

String endoCategoryResponseToJson(EndoCategoryResponse data) => json.encode(data.toJson());

class EndoCategoryResponse {
  EndoCategoryResponse({
    this.success,
    this.cats,
  });

  bool success;
  List<EndoCat> cats;

  factory EndoCategoryResponse.fromJson(Map<String, dynamic> json) => EndoCategoryResponse(
    success: json["success"],
    cats: List<EndoCat>.from(json["cats"].map((x) => EndoCat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "cats": List<dynamic>.from(cats.map((x) => x.toJson())),
  };
}

class EndoCat {
  EndoCat({
    this.id,
    this.engName,
    this.gerName,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String engName;
  String gerName;
  DateTime createdAt;
  DateTime updatedAt;

  factory EndoCat.fromJson(Map<String, dynamic> json) => EndoCat(
    id: json["id"],
    engName: json["eng_name"],
    gerName: json["ger_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "eng_name": engName,
    "ger_name": gerName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
