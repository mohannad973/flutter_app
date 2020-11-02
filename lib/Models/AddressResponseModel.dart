
import 'dart:convert';

List<AddressResponseModel> addressResponseModelFromJson(String str) => List<AddressResponseModel>.from(json.decode(str).map((x) => AddressResponseModel.fromJson(x)));

String addressResponseModelToJson(List<AddressResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
abstract class AddressList {
  List<AddressResponseModel> addList;

  AddressList(this.addList);

}
class AddressResponseModel {
  AddressResponseModel({
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
  String additionalInfo;
  DateTime createdAt;
  DateTime updatedAt;

  factory AddressResponseModel.fromJson(Map<String, dynamic> json) => AddressResponseModel(
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
}