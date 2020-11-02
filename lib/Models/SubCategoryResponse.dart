
import 'dart:convert';

SubCategoryResponse subCategoryResponseFromJson(String str) => SubCategoryResponse.fromJson(json.decode(str));

String subCategoryResponseToJson(SubCategoryResponse data) => json.encode(data.toJson());

class SubCategoryResponse {
  SubCategoryResponse({
    this.subCategories,
  });

  List<SubCategory> subCategories;

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) => SubCategoryResponse(
    subCategories: List<SubCategory>.from(json["SubCategories"].map((x) => SubCategory.fromJson(x))),
  );



  Map<String, dynamic> toJson() => {
    "SubCategories": List<dynamic>.from(subCategories.map((x) => x.toJson())),
  };
}

class SubCategory {
  SubCategory({
    this.id,
    this.engName,
    this.gerName,
    this.categoryId,
    this.description,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  int id;
   String engName;
   String gerName;
  int categoryId;
  String description;
  String imageUrl;
  DateTime createdAt;
  DateTime updatedAt;



  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["id"],
    engName: json["eng_name"],
    gerName: json["ger_name"],
    categoryId: json["category_id"],
    description: json["description"],
    imageUrl: json["image_url"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "eng_name": engName,
    "ger_name": gerName,
    "category_id": categoryId,
    "description": description,
    "image_url": imageUrl,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };




}
