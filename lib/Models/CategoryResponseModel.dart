import 'dart:convert';

List<CategoryResponseModel> categoryResponseModelFromJson(String str) => List<CategoryResponseModel>.from(json.decode(str).map((x) => CategoryResponseModel.fromJson(x)));

String categoryResponseModelToJson(List<CategoryResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryResponseModel {
  CategoryResponseModel({
    this.id,
    this.engName,
    this.gerName,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.subCategories,
    this.categoryId,
    this.description,
  });

  int id;
  String engName;
  String gerName;
  String imageUrl;
  DateTime createdAt;
  DateTime updatedAt;
  List<CategoryResponseModel> subCategories;
  int categoryId;
  String description;

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) => CategoryResponseModel(
    id: json["id"],
    engName: json["eng_name"],
    gerName: json["ger_name"],
    imageUrl: json["image_url"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    subCategories: json["sub_categories"] == null ? null : List<CategoryResponseModel>.from(json["sub_categories"].map((x) => CategoryResponseModel.fromJson(x))),
    categoryId: json["category_id"] == null ? null : json["category_id"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "eng_name": engName,
    "ger_name": gerName,
    "image_url": imageUrl,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "sub_categories": subCategories == null ? null : List<dynamic>.from(subCategories.map((x) => x.toJson())),
    "category_id": categoryId == null ? null : categoryId,
    "description": description == null ? null : description,
  };
}
