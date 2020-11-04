import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ora_app/Models/add_addressBody.dart';
import 'package:ora_app/Models/userModel.dart';
import 'package:ora_app/Providers/add_address_provider.dart';
import 'package:ora_app/Providers/citiesProvider.dart';
import 'package:ora_app/Providers/countries_providers.dart';
import 'package:ora_app/Providers/profile_provider.dart';
import 'package:ora_app/Util/session_manager.dart';
import 'package:ora_app/Utils/decorations.dart';
import 'package:ora_app/Utils/form_validators.dart';
import 'package:ora_app/address/componenets/city_picker.dart';
import 'package:ora_app/address/componenets/country_picker.dart';
import 'package:provider/provider.dart';

import '../My_Addresses.dart';

class AddAddressScreen extends StatefulWidget {
  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _addresskey = GlobalKey<FormState>();
  String email = '', firstName = '', lastName = '', phone = '';

  String password = '';
  String error = '';
  bool loading = false;
  String country, city;
  final TextEditingController firstNAmeController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController additionalInfoController =
      TextEditingController();
  final TextEditingController adreesLine1Controller = TextEditingController();
  final TextEditingController adressLine2Controller = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  UserModel _user;
  String token;
  SessionManager sessionManager = SessionManager();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 3.0),
                child: Text(
                  'Country',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CountryPicker(
                  countries:
                      Provider.of<CountryProvider>(context).countryResponse,
                  loadCities: (value) {
                    setState(() {
                      country = value;
                      print("country lift up:" + country);
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 3.0),
                child: Text(
                  'City',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
              ),
              Provider.of<CitiesProvider>(context).isLoading()
                  ? CircularProgressIndicator(
                      backgroundColor: Colors.black87,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CityPicker(
                        cityLift: (value) {
                          city = value;
                          print("city lift :" + city);
                        },
                      ),
                    ),
              Form(
                key: _addresskey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 3.0),
                        child: Text(
                          'Address Line 1',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          controller: adreesLine1Controller,
                          decoration: inputDecoration().copyWith(hintText: ''),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 3.0),
                        child: Text(
                          'Address Line 2',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          controller: adressLine2Controller,
                          decoration: inputDecoration().copyWith(hintText: ''),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 3.0),
                        child: Text(
                          'State',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          controller: stateController,
                          decoration: inputDecoration().copyWith(hintText: ''),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 3.0),
                        child: Text(
                          'Zip Code',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          controller: zipCodeController,
                          decoration: inputDecoration().copyWith(hintText: ''),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 3.0),
                        child: Text(
                          'Address Phone Number',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          controller: phoneController,
                          decoration: inputDecoration().copyWith(hintText: ''),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 3.0),
                        child: Text(
                          'Additional Info',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          controller: additionalInfoController,
                          decoration: inputDecoration().copyWith(hintText: ''),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Provider.of<AddAddressProvider>(context).isLoading()
                          ? Center(
                              child: CircularProgressIndicator(
                              backgroundColor: Colors.black87,
                            ))
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0),
                              child: RaisedButton(
                                color: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                                onPressed: () async {
                                  String authToken =
                                      await sessionManager.getAuthToken();
                                  if (_addresskey.currentState.validate()) {
                                    final String email = emailController.text;
                                    final String password =
                                        passwordController.text;

                                    final addressBody = AddAddressBody(
                                        city: city,
                                        country: country,
                                        address1: adreesLine1Controller.text,
                                        address2: adressLine2Controller.text,
                                        addressPhone: phoneController.text,
                                        state: stateController.text,
                                        zipCode: zipCodeController.text,
                                        additionalInfo:
                                            additionalInfoController.text);
                                    // final UserModel user = await register(registerBody);
                                    print("auth token address : " + authToken);
                                    Provider.of<AddAddressProvider>(context,
                                            listen: false)
                                        .addAddress(addressBody, authToken);
                                    // print("added test  "+Provider.of<AddAddressProvider>(context,
                                    //     listen: false)
                                    //     .added.toString());
                                    if (Provider.of<AddAddressProvider>(context,
                                                listen: false)
                                            .added !=
                                        false) {
                                      Provider.of<ProfileProvider>(context,
                                              listen: false)
                                          .getProfile(authToken);
                                      Timer(Duration(seconds: 3), () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyAddresses(
                                                    addressList: Provider.of<
                                                                ProfileProvider>(
                                                            context,
                                                            listen: false)
                                                        .addresses,
                                                  )),
                                        );
                                      });
                                    }
                                  }
                                  _addresskey.currentState.save();
                                },
                                child: Text(
                                  "Add Address",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
