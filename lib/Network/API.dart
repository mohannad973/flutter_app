import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:async';

import 'package:ora_app/Models/ChangePasswordBody.dart';
import 'package:ora_app/Models/StringSuccessResponse.dart';
import 'package:ora_app/Models/add_addressBody.dart';
import 'package:ora_app/Models/rigesterBody.dart';
import 'package:ora_app/Models/userModel.dart';

const baseUrl = "http://ora.hashtagweb.online/api";
const newBaseUrl = "http://test-ora.hashtagweb.online/api";

class API {
  Future getCategories() {
    var url = baseUrl + "/getCategories";
    return http.get(url);
  }

  static Future getEvents() {
    var url = baseUrl + "/getEvents";
    return http.get(url);
  }

  static Future getAddress(String token) {
    var url = baseUrl + "/getMyAddresses";
    return http.get(url, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.ACCEPT: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
  }

  static Future getCources() async {
    var url = baseUrl + "/getCourses";
    return await http.get(url);
  }

  Future getSubCategories() async {
    var url = baseUrl + "/getSubCategories";
    http.Response response = await http.get(url);
    return response;
  }

  static Future getProducts(String id) async {
    var url = baseUrl + "/getProductsBySubCategoryId";
    http.Response response = await http.post(url, body: {
      "id": id,
    });
    return response;
  }

  Future changePassword(ChangePasswordBody changePasswordBody) {
    var url = baseUrl + "/changePassword";

    return http.post(url, body: {
      "user_id": changePasswordBody.user_id,
      "old_password": changePasswordBody.old_password,
      "new_password": changePasswordBody.new_password,
    });
  }

  Future login(String email, String password) async {
    try {
      final String apiUrl = newBaseUrl + '/login';
      final response =
          await http.post(apiUrl, body: {"email": email, "password": password});

      if (response.statusCode == 200) {
        final String responseString = response.body;

        return userModelFromJson(responseString);
      } else {
        print(response.statusCode);
        print('1');
        return null;
      }
    } catch (e) {
      print('2');

      return null;
    }
  }

  static Future search(String term) async {
    var url = baseUrl + "/search";
    http.Response response = await http.post(url, body: {
      "name": term,
    });
    return response;
  }

  static Future forgotPassword(String email) async {
    var url = baseUrl + "/forgetPassword";
    http.Response response = await http.post(url, body: {
      "email": email,
    });
    return response;
  }

  static Future resetPassword(
      String code, String email, String password) async {
    var url = baseUrl + "/resetPassword";
    http.Response response = await http.post(url,
        body: {"code": code, "email": email, "new_password": password});
    return response;
  }

  Future getCountries() async {
    var url = newBaseUrl + "/getCountries";

    Response response = await http.get(url);

    return response;
  }

  Future getImplants() async {
    var url = newBaseUrl + "/implant/getCats";
    http.Response response = await http.get(url);
    return response;
  }

  Future getCities(String country) async {
    var url = newBaseUrl + "/getCities/" + country.trim();
    http.Response response = await http.get(url);

    return response;
  }

  Future getDiameters(int implantId) async {
    var url = newBaseUrl + "/implant/getDias/" + implantId.toString();
    http.Response response = await http.get(url);
    return response;
  }

  Future getDiasInfo(int diasId) async {
    var url = newBaseUrl + "/implant/getDiaSeq/" + diasId.toString();
    http.Response response = await http.get(url);
    return response;
  }

  Future getProfile(String token) {
    var url = newBaseUrl + "/getProfile";
    return http.get(url, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.ACCEPT: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
  }

  Future getProstheticCat() {
    var url = newBaseUrl + "/prosthetic/getCats";
    return http.get(url);
  }

  Future<UserModel> register(RegisterBody registerBody) async {
    final String apiUrl = newBaseUrl + "/register";
    final response = await http.post(apiUrl, body: {
      "first_name": registerBody.firstName,
      "last_name": registerBody.lastName,
      "username": registerBody.userName,
      "email": registerBody.email,
      "password": registerBody.password,
      "phone": registerBody.phone,
      "full_name": registerBody.fullName,
      "address_line1": registerBody.address1,
      "address_line2": registerBody.address2,
      "country": registerBody.country,
      "city": registerBody.city,
      "zip_code": registerBody.zipCode,
      "state": registerBody.state,
      "address_phone": registerBody.addressPhone,
    });

    if (response.statusCode == 200) {
      debugPrint('responsetest: ${response.statusCode.toString()}');
      final String responseString = response.body;
      return userModelFromJson(responseString);
    } else {
      debugPrint('responsetest: ${response.statusCode.toString()}');
      return null;
    }
  }

  Future getProsData(String id, int page) async {
    String url =
        Uri.encodeFull(newBaseUrl + '/prosthetic/getByCat/$id?page=$page');
    print("api url" + url);
    http.Response response = await http.get(url);
    return response;
  }

  Future<SuccessResponse> addAddress(
      AddAddressBody addAddressBody, String token) async {
    final String apiUrl = newBaseUrl + "/address/store";
    final response = await http.post(apiUrl, body: {
      "address_line1": addAddressBody.address1,
      "address_line2": addAddressBody.address2,
      "country": addAddressBody.country,
      "city": addAddressBody.city,
      "zip_code": addAddressBody.zipCode,
      "state": addAddressBody.state,
      "phone": addAddressBody.addressPhone,
      "additional_info": addAddressBody.additionalInfo
    }, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });

    if (response.statusCode == 200) {
      debugPrint('responsetest: ${response.statusCode.toString()}');
      final String responseString = response.body;
      return successResponseFromJson(responseString);
    } else {
      debugPrint('responsetest: ${response.statusCode.toString()}');
      return null;
    }
  }

  Future<SuccessResponse> deleteAddress(int id, String token) async {
    final String apiUrl = newBaseUrl + '/address/delete/+$id';
    final response = await http.post('$apiUrl', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.ACCEPT: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });

    if (response.statusCode == 200) {
      debugPrint('responsetest: ${response.statusCode.toString()}');
      final String responseString = response.body;
      return successResponseFromJson(responseString);
    } else {
      debugPrint('responsetest25: ${response.statusCode.toString()}');
      return null;
    }
  }

  Future<SuccessResponse> editAddress(
      int id, String token, AddAddressBody addressInfo) async {
    final String apiUrl = newBaseUrl + "/address/update/+$id";
    final body = jsonEncode({
      "country": addressInfo.country,
      "city": addressInfo.city,
      "phone": addressInfo.addressPhone,
      "zip_code": addressInfo.zipCode,
      "address_line1": addressInfo.address1
    });
    final response = await http.post(apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body);
    if (response.statusCode == 200) {
      final String responseFormJson = response.body;
      debugPrint('responsetest: ${response.statusCode.toString()}');
      return successResponseFromJson(responseFormJson);
    } else {
      debugPrint('Wrooooong: ${response.statusCode.toString()}');
      return null;
    }
  }
}
