// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.success,
    this.token,
  });

  bool success;
  String token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    success: json["success"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "token": token,
  };

  @override
  String toString() {
    return 'UserModel{success: $success, token: $token}';
  }
}
