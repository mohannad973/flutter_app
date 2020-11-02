// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) => json.encode(data.toJson());

class ProfileResponse {
  ProfileResponse({
    this.userProfile,
  });

  List<UserProfile> userProfile;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
    userProfile: List<UserProfile>.from(json["User Profile"].map((x) => UserProfile.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "User Profile": List<dynamic>.from(userProfile.map((x) => x.toJson())),
  };
}

class UserProfile {
  UserProfile({
    this.id,
    this.uuid,
    this.resetPasswordCode,
    this.firstName,
    this.lastName,
    this.username,
    this.phone,
    this.isSubscribed,
    this.email,
    this.avatarType,
    this.avatarLocation,
    this.passwordChangedAt,
    this.active,
    this.confirmationCode,
    this.confirmed,
    this.timezone,
    this.lastLoginAt,
    this.lastLoginIp,
    this.toBeLoggedOut,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.fullName,
    this.addresses,
  });

  int id;
  String uuid;
  dynamic resetPasswordCode;
  String firstName;
  String lastName;
  dynamic username;
  dynamic phone;
  int isSubscribed;
  String email;
  String avatarType;
  dynamic avatarLocation;
  dynamic passwordChangedAt;
  bool active;
  String confirmationCode;
  bool confirmed;
  dynamic timezone;
  dynamic lastLoginAt;
  dynamic lastLoginIp;
  bool toBeLoggedOut;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String fullName;
  List<dynamic> addresses;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    id: json["id"],
    uuid: json["uuid"],
    resetPasswordCode: json["reset_password_code"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    username: json["username"],
    phone: json["phone"],
    isSubscribed: json["is_subscribed"],
    email: json["email"],
    avatarType: json["avatar_type"],
    avatarLocation: json["avatar_location"],
    passwordChangedAt: json["password_changed_at"],
    active: json["active"],
    confirmationCode: json["confirmation_code"],
    confirmed: json["confirmed"],
    timezone: json["timezone"],
    lastLoginAt: json["last_login_at"],
    lastLoginIp: json["last_login_ip"],
    toBeLoggedOut: json["to_be_logged_out"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    fullName: json["full_name"],
    addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "reset_password_code": resetPasswordCode,
    "first_name": firstName,
    "last_name": lastName,
    "username": username,
    "phone": phone,
    "is_subscribed": isSubscribed,
    "email": email,
    "avatar_type": avatarType,
    "avatar_location": avatarLocation,
    "password_changed_at": passwordChangedAt,
    "active": active,
    "confirmation_code": confirmationCode,
    "confirmed": confirmed,
    "timezone": timezone,
    "last_login_at": lastLoginAt,
    "last_login_ip": lastLoginIp,
    "to_be_logged_out": toBeLoggedOut,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "full_name": fullName,
    "addresses": List<dynamic>.from(addresses.map((x) => x)),
  };
}
