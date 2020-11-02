// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) => json.encode(data.toJson());

class ProfileResponse {
  ProfileResponse({
    this.success,
    this.user,
  });

  bool success;
  User user;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
    success: json["success"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "user": user.toJson(),
  };
}

class User {
  User({
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
  String username;
  String phone;
  int isSubscribed;
  String email;
  String avatarType;
  dynamic avatarLocation;
  dynamic passwordChangedAt;
  bool active;
  dynamic confirmationCode;
  bool confirmed;
  dynamic timezone;
  dynamic lastLoginAt;
  dynamic lastLoginIp;
  bool toBeLoggedOut;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String fullName;
  List<Address> addresses;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
    addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
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
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'User{id: $id, uuid: $uuid, resetPasswordCode: $resetPasswordCode, firstName: $firstName, lastName: $lastName, username: $username, phone: $phone, isSubscribed: $isSubscribed, email: $email, avatarType: $avatarType, avatarLocation: $avatarLocation, passwordChangedAt: $passwordChangedAt, active: $active, confirmationCode: $confirmationCode, confirmed: $confirmed, timezone: $timezone, lastLoginAt: $lastLoginAt, lastLoginIp: $lastLoginIp, toBeLoggedOut: $toBeLoggedOut, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, fullName: $fullName, addresses: $addresses}';
  }
}

class Address {
  Address({
    this.id,
    this.fullName,
    this.userId,
    this.country,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.zipCode,
    this.phone,
    this.additionalInfo,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String fullName;
  int userId;
  String country;
  String addressLine1;
  String addressLine2;
  String city;
  String state;
  String zipCode;
  String phone;
  dynamic additionalInfo;
  DateTime createdAt;
  DateTime updatedAt;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    fullName: json["full_name"],
    userId: json["user_id"],
    country: json["country"],
    addressLine1: json["address_line1"],
    addressLine2: json["address_line2"],
    city: json["city"],
    state: json["state"],
    zipCode: json["zip_code"],
    phone: json["phone"],
    additionalInfo: json["additional_info"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "user_id": userId,
    "country": country,
    "address_line1": addressLine1,
    "address_line2": addressLine2,
    "city": city,
    "state": state,
    "zip_code": zipCode,
    "phone": phone,
    "additional_info": additionalInfo,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  @override
  String toString() {
    return 'Address{id: $id, fullName: $fullName, userId: $userId, country: $country, addressLine1: $addressLine1, addressLine2: $addressLine2, city: $city, state: $state, zipCode: $zipCode, phone: $phone, additionalInfo: $additionalInfo, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
