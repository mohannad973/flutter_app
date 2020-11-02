// To parse this JSON data, do
//
//     final implantResponse = implantResponseFromJson(jsonString);

import 'dart:convert';

ImplantResponse implantResponseFromJson(String str) => ImplantResponse.fromJson(json.decode(str));

String implantResponseToJson(ImplantResponse data) => json.encode(data.toJson());

class ImplantResponse {
  ImplantResponse({
    this.success,
    this.cats,
  });

  bool success;
  List<Cat> cats;

  factory ImplantResponse.fromJson(Map<String, dynamic> json) => ImplantResponse(
    success: json["success"],
    cats: List<Cat>.from(json["cats"].map((x) => Cat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "cats": List<dynamic>.from(cats.map((x) => x.toJson())),
  };
}

class Cat {
  Cat({
    this.id,
    this.engName,
    this.gerName,
    this.price,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String engName;
  String gerName;
  int price;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
    id: json["id"],
    engName: json["eng_name"],
    gerName: json["ger_name"],
    price: json["price"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "eng_name": engName,
    "ger_name": gerName,
    "price": price,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
