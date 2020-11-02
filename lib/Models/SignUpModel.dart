// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    this.success,
  });

  Success success;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    success: Success.fromJson(json["success"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success.toJson(),
  };
}

class Success {
  Success({
    this.user,
    this.token,
    this.address,
  });

  User user;
  String token;
  AddressModel address;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
    user: User.fromJson(json["user"]),
    token: json["token"],
    address: AddressModel.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
    "address": address.toJson(),
  };
}

class AddressModel {
  AddressModel({
    this.userId,
    this.fullName,
    this.zipCode,
    this.phone,
    this.country,
    this.city,
    this.state,
    this.addressLine1,
    this.addressLine2,
    this.additionalInfo,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  int userId;
  String fullName;
  String zipCode;
  String phone;
  String country;
  String city;
  String state;
  String addressLine1;
  String addressLine2;
  String additionalInfo;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    userId: json["user_id"],
    fullName: json["full_name"],
    zipCode: json["zip_code"],
    phone: json["phone"],
    country: json["country"],
    city: json["city"],
    state: json["state"],
    addressLine1: json["address_line1"],
    addressLine2: json["address_line2"],
    additionalInfo: json["additional_info"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "full_name": fullName,
    "zip_code": zipCode,
    "phone": phone,
    "country": country,
    "city": city,
    "state": state,
    "address_line1": addressLine1,
    "address_line2": addressLine2,
    "additional_info": additionalInfo,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}

class User {
  User({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.username,
    this.isSubscribed,
    this.uuid,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.fullName,
    this.roles,
  });

  String firstName;
  String lastName;
  String email;
  String phone;
  String username;
  bool isSubscribed;
  String uuid;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  String fullName;
  List<Role> roles;

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
    username: json["username"],
    isSubscribed: json["is_subscribed"],
    uuid: json["uuid"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    fullName: json["full_name"],
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "username": username,
    "is_subscribed": isSubscribed,
    "uuid": uuid,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
    "full_name": fullName,
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}

class Role {
  Role({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  int id;
  String name;
  String guardName;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    guardName: json["guard_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "guard_name": guardName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  Pivot({
    this.modelId,
    this.roleId,
    this.modelType,
  });

  int modelId;
  int roleId;
  String modelType;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    modelId: json["model_id"],
    roleId: json["role_id"],
    modelType: json["model_type"],
  );

  Map<String, dynamic> toJson() => {
    "model_id": modelId,
    "role_id": roleId,
    "model_type": modelType,
  };
}
