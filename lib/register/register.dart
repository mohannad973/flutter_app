import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ora_app/Models/rigesterBody.dart';
import 'package:ora_app/Models/userModel.dart';
import 'package:ora_app/Providers/citiesProvider.dart';
import 'package:ora_app/Providers/countries_providers.dart';
import 'package:ora_app/Providers/register_provider.dart';
import 'package:ora_app/Util/session_manager.dart';
import 'package:ora_app/Utils/decorations.dart';
import 'package:ora_app/Utils/form_validators.dart';
import 'package:ora_app/address/componenets/city_picker.dart';
import 'package:ora_app/address/componenets/country_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;

import '../bottom_navigation_bar.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _signUpKey = GlobalKey<FormState>();
  String email = '', firstName = '', lastName = '', phone = '';

  String password = '';
  String error = '';
  bool loading = false;
  String country , city;
  final TextEditingController firstNAmeController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController adreesLine1Controller = TextEditingController();
  final TextEditingController adressLine2Controller = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();


  UserModel _user;
  String token;
  SessionManager sessionManager = SessionManager();

  Future<UserModel> register(RegisterBody registerBody) async {
    final String apiUrl = "http://test-ora.hashtagweb.online/api/register";
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Provider.of<CountryProvider>(context).isLoading()
            ? Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.black87,
              ))
            : SingleChildScrollView(
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
                          countries: Provider.of<CountryProvider>(context)
                              .countryResponse,
                      loadCities: (value){
                            setState(() {
                              country = value;
                              print("country lift up:" + country);
                            });
                      },),
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
                            child: CityPicker(cityLift: (value){
                              city = value;
                              print("city lift :"+city);
                            },),
                          ),

                    Form(
                      key: _signUpKey,
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
                                'First Name',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(

                              child: TextFormField(
                                scrollPadding:
                                EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
                                validator: emptyFieldVAlidator(firstName),
                                onChanged: (val) {
                                  setState(() => firstName = val);
                                },
                                controller: firstNAmeController,
                                decoration: inputDecoration().copyWith(hintText: 'John'),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0, left: 3.0),
                              child: Text(
                                'Last Name',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              // height: 50,
                              child: TextFormField(
                                scrollPadding:
                                EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
                                onChanged: (val) {
                                  setState(() => lastName = val);
                                },
                                validator: emptyFieldVAlidator(lastName),
                                controller: lastNameController,
                                decoration: inputDecoration().copyWith(hintText: 'Doe'),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0, left: 3.0),
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              // height: 50,
                              child: TextFormField(
                                scrollPadding:
                                EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                validator: emailValidator(email),
                                controller: emailController,
                                decoration: inputDecoration()
                                    .copyWith(hintText: 'Example@mail.com'),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0, left: 3.0),
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              // height: 50,
                              child: TextFormField(
                                scrollPadding:
                                EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                                validator: passwordValidator(),
                                controller: passwordController,
                                decoration:
                                inputDecoration().copyWith(hintText: '********'),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0, left: 3.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Phone Number',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '(Optional)',
                                    style: TextStyle(
                                      color: Color(0xFF275C5D),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              // height: 50,
                              child: TextFormField(
                                scrollPadding:
                                EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
                                onChanged: (val) {
                                  setState(() => phone = val);
                                },
                                validator: emptyFieldVAlidator(phone),
                                controller: phoneNumberController,
                                decoration:
                                inputDecoration().copyWith(hintText: ' Number'),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            Padding(
                              padding:
                              const EdgeInsets.only(bottom: 8.0, left: 3.0),
                              child: Text(
                                'User Name',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              child: TextFormField(
                                controller: userNameController,
                                decoration:
                                inputDecoration().copyWith(hintText: ''),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(bottom: 8.0, left: 3.0),
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
                                decoration:
                                inputDecoration().copyWith(hintText: ''),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(bottom: 8.0, left: 3.0),
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
                                decoration:
                                inputDecoration().copyWith(hintText: ''),
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(bottom: 8.0, left: 3.0),
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
                                decoration:
                                inputDecoration().copyWith(hintText: ''),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(bottom: 8.0, left: 3.0),
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
                                decoration:
                                inputDecoration().copyWith(hintText: ''),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(bottom: 8.0, left: 3.0),
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
                                decoration:
                                inputDecoration().copyWith(hintText: ''),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Provider.of<RegisterProvider>(context).isLoading()? Center(child: CircularProgressIndicator(backgroundColor: Colors.black87,))
                           : Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              child: RaisedButton(
                                color: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                                onPressed: () async {
                                  if (_signUpKey.currentState.validate()) {
                                    final String email = emailController.text;
                                    final String password = passwordController.text;

                                    final registerBody = RegisterBody(
                                       firstName: firstNAmeController.text,
                                      lastName: lastNameController.text,
                                      email: emailController.text,
                                      fullName: firstNAmeController.text+lastNameController.text,
                                      city: city,
                                      country: country,
                                      address1: adreesLine1Controller.text,
                                      address2: adressLine2Controller.text,
                                      addressPhone: phoneController.text,
                                      phone: phoneNumberController.text,
                                      password: passwordController.text,
                                      state: stateController.text,
                                      userName: userNameController.text,
                                      zipCode: zipCodeController.text
                                    );
                                     // final UserModel user = await register(registerBody);
                                    Provider.of<RegisterProvider>(context,listen: false).register(registerBody);
                                    print("userModel11111"+Provider.of<RegisterProvider>(context,listen: false).userModel.toString());
                                    if (Provider.of<RegisterProvider>(context,listen: false).userModel != null) {
                                      print("user auth"+Provider.of<RegisterProvider>(context,listen: false).userModel.toString());
                                      Timer(Duration(seconds: 3), () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => BottomBar()),
                                        );
                                      });

                                    }
                                  }
                                  _signUpKey.currentState.save();
                                },
                                child: Text(
                                  "Sign Up",
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
            ));
  }
}
