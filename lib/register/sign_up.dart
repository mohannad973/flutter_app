import 'package:flutter/material.dart';
import 'package:ora_app/Models/SignUpModel.dart';
import 'package:ora_app/Providers/countries_providers.dart';
import 'package:ora_app/Utils/form_validators.dart';
import 'package:ora_app/sign_in.dart';
import 'package:provider/provider.dart';
import '../address/add_address.dart';
import '../Utils/decorations.dart';

import 'package:flutter/material.dart';
import 'package:ora_app/Util/session_manager.dart';
import 'package:ora_app/home_page.dart';
import 'file:///E:/hashtag%20progects/ora-master/lib/register/sign_up.dart';
import '../Models/userModel.dart';
import '../Utils/decorations.dart';
import 'package:http/http.dart' as http;
import 'package:ora_app/modules.dart';
import 'package:ora_app/Models/rigesterBody.dart';

import '../bottom_navigation_bar.dart';

final _signUpKey = GlobalKey<FormState>();

class SignUp extends StatefulWidget {
  final AddressModul addressModul;
  final Function toggleView;

  SignUp({this.toggleView, this.addressModul});

  @override
  _SignUpState createState() => _SignUpState();
}

Future<SignUpModel> register(RegisterBody registerBody) async {
  final String apiUrl = "http://ora.hashtagweb.online/api/register";
  // final response = await http.post(apiUrl, body: {
  //   "first_name": registerBody.firstName,
  //   "last_name": registerBody.lastNaem,
  //   "username": registerBody.userName,
  //   "email": registerBody.email,
  //   "password": registerBody.password,
  //   "phone": registerBody.phone,
  //   "full_name": registerBody.fullName,
  //   "address_line1": registerBody.address1,
  //   "address_line2": registerBody.address2,
  //   "country": registerBody.country,
  //   "city": registerBody.city,
  //   "zip_code": registerBody.zipCode,
  //   "state": registerBody.state,
  //   "additional_info": registerBody.additionalInfo,
  //   "address_phone": registerBody.addressPhone,
  // });
  //
  // if (response.statusCode == 200) {
  //   debugPrint('responsetest: ${response.statusCode.toString()}');
  //   final String responseString = response.body;
  //   return signUpModelFromJson(responseString);
  // } else {
  //   debugPrint('responsetest: ${response.statusCode.toString()}');
  //   return null;
  // }
}

class _SignUpState extends State<SignUp> {
  String email = '', firstName = '', lastName = '', phone = '';

  String password = '';
  String error = '';
  bool loading = false;
  final TextEditingController firstNAmeController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  UserModel _user;
  String token;
  SessionManager sessionManager = SessionManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      theme: ThemeData(primarySwatch: Theme.of(context).primaryColor),

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            FlatButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
                icon: Icon(
                  Icons.person_add,
                  color: Theme.of(context).cardColor,
                ),
                label: Text(
                  "Sign In",
                  style: TextStyle(color: Theme.of(context).cardColor),
                )),
          ],
        ),
        body: SignUpUI(context));
  }

  SingleChildScrollView SignUpUI(BuildContext context) {
    //var item = new AddressModul();
    var addressModul;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              'assets/ora1.png',
              height: 60,
            ),
          ),
          SizedBox(
            height: 5,
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: RaisedButton.icon(
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      onPressed: () => {
                      Provider.of<CountryProvider>(context,listen: false).getCountries(),

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddressScreen(
                                  address: addressModul,
                                )))

                      },
                      label: Text(
                        'Add Address',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.add_location,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: RaisedButton(
              color: Color(0xFF275C5D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
              onPressed: () async {
                // if (_signUpKey.currentState.validate()) {
                //   final String email = emailController.text;
                //   final String password = passwordController.text;
                //
                //   final registerBody = RegisterBody(
                //       firstNAmeController.text,
                //       lastNameController.text,
                //       'aaa',
                //       emailController.text,
                //       passwordController.text.trim(),
                //       phoneNumberController.text,
                //       widget.addressModul.fullName,
                //       widget.addressModul.addressLine1,
                //       widget.addressModul.addressLine2,
                //       widget.addressModul.country,
                //       widget.addressModul.city,
                //       widget.addressModul.state,
                //       widget.addressModul.zipCode,
                //       widget.addressModul.phoneNumber,
                //       'aaa');
                //   final SignUpModel user = await register(registerBody);
                //   if (user != null) {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => BottomBar()),
                //     );
                //   }
                // }
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
    );
  }
}
