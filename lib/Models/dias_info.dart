// To parse this JSON data, do
//
//     final diasInfoResponse = diasInfoResponseFromJson(jsonString);

import 'dart:convert';

DiasInfoResponse diasInfoResponseFromJson(String str) => DiasInfoResponse.fromJson(json.decode(str));

String diasInfoResponseToJson(DiasInfoResponse data) => json.encode(data.toJson());

class DiasInfoResponse {
  DiasInfoResponse({
    this.success,
    this.dia,
  });

  bool success;
  Dia dia;

  factory DiasInfoResponse.fromJson(Map<String, dynamic> json) => DiasInfoResponse(
    success: json["success"],
    dia: Dia.fromJson(json["dia"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "dia": dia.toJson(),
  };

  @override
  String toString() {
    return 'DiasInfoResponse{success: $success, dia: $dia}';
  }
}

class Dia {
  Dia({
    this.id,
    this.impCatId,
    this.diameter,
    this.prostheticColorCode,
    this.surgicalColorCode,
    this.createdAt,
    this.updatedAt,
    this.lengths,
    this.surgicalSeq,
  });

  int id;
  int impCatId;
  double diameter;
  String prostheticColorCode;
  String surgicalColorCode;
  DateTime createdAt;
  DateTime updatedAt;
  List<Length> lengths;
  List<SurgicalSeq> surgicalSeq;

  factory Dia.fromJson(Map<String, dynamic> json) => Dia(
    id: json["id"],
    impCatId: json["imp_cat_id"],
    diameter: json["diameter"].toDouble(),
    prostheticColorCode: json["prosthetic_color_code"],
    surgicalColorCode: json["surgical_color_code"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    lengths: List<Length>.from(json["lengths"].map((x) => Length.fromJson(x))),
    surgicalSeq: List<SurgicalSeq>.from(json["surgical_seq"].map((x) => SurgicalSeq.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imp_cat_id": impCatId,
    "diameter": diameter,
    "prosthetic_color_code": prostheticColorCode,
    "surgical_color_code": surgicalColorCode,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "lengths": List<dynamic>.from(lengths.map((x) => x.toJson())),
    "surgical_seq": List<dynamic>.from(surgicalSeq.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'Dia{id: $id, impCatId: $impCatId, diameter: $diameter, prostheticColorCode: $prostheticColorCode, surgicalColorCode: $surgicalColorCode, createdAt: $createdAt, updatedAt: $updatedAt, lengths: $lengths, surgicalSeq: $surgicalSeq}';
  }
}

class Length {
  Length({
    this.id,
    this.impDiaId,
    this.length,
    this.ref,
  });

  int id;
  int impDiaId;
  double length;
  String ref;

  factory Length.fromJson(Map<String, dynamic> json) => Length(
    id: json["id"],
    impDiaId: json["imp_dia_id"],
    length: json["length"].toDouble(),
    ref: json["ref"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imp_dia_id": impDiaId,
    "length": length,
    "ref": ref,
  };

  @override
  String toString() {
    return 'Length{id: $id, impDiaId: $impDiaId, length: $length, ref: $ref}';
  }
}

class SurgicalSeq {
  SurgicalSeq({
    this.id,
    this.impCatId,
    this.prosCompId,
    this.sequence,
    this.createdAt,
    this.updatedAt,
    this.impDiaId,
    this.prostheticCom,
  });

  int id;
  dynamic impCatId;
  int prosCompId;
  int sequence;
  DateTime createdAt;
  DateTime updatedAt;
  int impDiaId;
  ProstheticCom prostheticCom;

  factory SurgicalSeq.fromJson(Map<String, dynamic> json) => SurgicalSeq(
    id: json["id"],
    impCatId: json["imp_cat_id"],
    prosCompId: json["pros_comp_id"],
    sequence: json["sequence"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    impDiaId: json["imp_dia_id"],
    prostheticCom: ProstheticCom.fromJson(json["prosthetic_com"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imp_cat_id": impCatId,
    "pros_comp_id": prosCompId,
    "sequence": sequence,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "imp_dia_id": impDiaId,
    "prosthetic_com": prostheticCom.toJson(),
  };

  @override
  String toString() {
    return 'SurgicalSeq{id: $id, impCatId: $impCatId, prosCompId: $prosCompId, sequence: $sequence, createdAt: $createdAt, updatedAt: $updatedAt, impDiaId: $impDiaId, prostheticCom: $prostheticCom}';
  }
}

class ProstheticCom {
  ProstheticCom({
    this.id,
    this.ref,
    this.image,
    this.price,
  });

  int id;
  String ref;
  String image;
  int price;

  factory ProstheticCom.fromJson(Map<String, dynamic> json) => ProstheticCom(
    id: json["id"],
    ref: json["ref"],
    image: json["image"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ref": ref,
    "image": image,
    "price": price,
  };

  @override
  String toString() {
    return 'ProstheticCom{id: $id, ref: $ref, image: $image, price: $price}';
  }
}
