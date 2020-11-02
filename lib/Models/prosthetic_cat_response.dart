// To parse this JSON data, do
//
//     final prostheticCategoryResponse = prostheticCategoryResponseFromJson(jsonString);

import 'dart:convert';

ProstheticCategoryResponse prostheticCategoryResponseFromJson(String str) => ProstheticCategoryResponse.fromJson(json.decode(str));

String prostheticCategoryResponseToJson(ProstheticCategoryResponse data) => json.encode(data.toJson());

class ProstheticCategoryResponse {
  ProstheticCategoryResponse({
    this.success,
    this.prosCat,
  });

  bool success;
  List<ProsCat> prosCat;

  factory ProstheticCategoryResponse.fromJson(Map<String, dynamic> json) => ProstheticCategoryResponse(
    success: json["success"],
    prosCat: List<ProsCat>.from(json["cats"].map((x) => ProsCat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "cats": List<dynamic>.from(prosCat.map((x) => x.toJson())),
  };
}

class ProsCat {
  ProsCat({
    this.id,
    this.prosId,
    this.engName,
    this.gerName,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int prosId;
  String engName;
  String gerName;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProsCat.fromJson(Map<String, dynamic> json) => ProsCat(
    id: json["id"],
    prosId: json["pros_id"],
    engName: json["eng_name"],
    gerName: json["ger_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pros_id": prosId,
    "eng_name": engName,
    "ger_name": gerName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  @override
  String toString() {
    return 'ProsCat{id: $id, prosId: $prosId, engName: $engName, gerName: $gerName, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
