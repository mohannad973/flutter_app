// To parse this JSON data, do
//
//     final prosthseticByCatResponse = prosthseticByCatResponseFromJson(jsonString);

import 'dart:convert';

ProstheticByCatResponse prostheticByCatResponseFromJson(String str) => ProstheticByCatResponse.fromJson(json.decode(str));

String prostheticByCatResponseToJson(ProstheticByCatResponse data) => json.encode(data.toJson());

class ProstheticByCatResponse {
  ProstheticByCatResponse({
    this.success,
    this.components,
  });

  bool success;
  Components components;
  String errorMessage = "error";

  factory ProstheticByCatResponse.fromJson(Map<String, dynamic> json) => ProstheticByCatResponse(
    success: json["success"],
    components: Components.fromJson(json["components"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "components": components.toJson(),
  };

  ProstheticByCatResponse.withError(String errorMessage) {
    this.errorMessage = errorMessage;
  }

  @override
  String toString() {
    return 'ProstheticByCatResponse{success: $success, components: $components, errorMessage: $errorMessage}';
  }
}

class Components {
  Components({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  dynamic currentPage;
  List<Datum> data;
  String firstPageUrl;
  dynamic from;
  dynamic lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  dynamic perPage;
  dynamic prevPageUrl;
  dynamic to;
  dynamic total;

  factory Components.fromJson(Map<String, dynamic> json) => Components(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };

  @override
  String toString() {
    return 'Components{currentPage: $currentPage, data: $data, firstPageUrl: $firstPageUrl, from: $from, lastPage: $lastPage, lastPageUrl: $lastPageUrl, nextPageUrl: $nextPageUrl, path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to, total: $total}';
  }
}

class Datum {
  Datum({
    this.id,
    this.engName,
    this.gerName,
    this.prosCatId,
    this.typeId,
    this.price,
    this.ref,
    this.ml,
    this.diameter,
    this.height,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String engName;
  String gerName;
  int prosCatId;
  int typeId;
  int price;
  String ref;
  dynamic ml;
  double diameter;
  int height;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    engName: json["eng_name"],
    gerName: json["ger_name"],
    prosCatId: json["pros_cat_id"],
    typeId: json["type_id"],
    price: json["price"],
    ref: json["ref"],
    ml: json["ML"],
    diameter: json["diameter"].toDouble(),
    height: json["height"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "eng_name": engName,
    "ger_name": gerName,
    "pros_cat_id": prosCatId,
    "type_id": typeId,
    "price": price,
    "ref": ref,
    "ML": ml,
    "diameter": diameter,
    "height": height,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  @override
  String toString() {
    return 'Datum{id: $id, engName: $engName, gerName: $gerName, prosCatId: $prosCatId, typeId: $typeId, price: $price, ref: $ref, ml: $ml, diameter: $diameter, height: $height, image: $image, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
