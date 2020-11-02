import 'package:flutter/material.dart';
import 'package:ora_app/Models/ChangePassordResponse.dart';
import 'package:ora_app/Models/ChangePasswordBody.dart';
import 'package:ora_app/Models/StringSuccessResponse.dart';
import 'package:ora_app/Models/rigesterBody.dart';
import 'package:ora_app/home_page.dart';
import 'package:ora_app/profile.dart';
import 'package:ora_app/sign_in.dart';
import 'file:///E:/hashtag%20progects/ora-master/lib/register/sign_up.dart';
import 'My_Addresses.dart';
import 'Network/API.dart';
import 'app_bar.dart';
import 'Utils/decorations.dart';
import 'package:http/http.dart' as http;

String oldPassword = '';
String code = '';
String newPassword = '';
String confirmPassword = '';
String error = '';
bool loading = false;

class ResetPassword extends StatefulWidget {
  String email;

  ResetPassword({this.email});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String response;

  _showSnackBar(String text) {
    final snackBar = new SnackBar(
      content: new Text(text),
      duration: new Duration(seconds: 3),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  _resetPassword(String code, String email, String password) async {
    String responseCode;
    try {
      API.resetPassword(code, email, password).then((response) {
        final String responseString = response.body;

        setState(() {
          setState(() {
            response = successResponseFromJson(responseString);
          });
        });
      });

      return response;
    } catch (e) {
      return null;
    }

    //print(categories[0].engName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: topBar(
          context, barWithBack(context), Text('Ora'), barWithSearch(context)),
      body: changePasswordUI(context),
    );
  }

  SingleChildScrollView changePasswordUI(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // padding: EdgeInsets.fromLTRB(40.0, 80.0, 40.0, 0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(40.0, 80.0, 40.0, 0),
          child: Column(
            children: [
              Image.asset(
                'assets/ora1.png',
                height: 80,
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: codeController,
                      decoration: inputDecoration().copyWith(hintText: 'Code'),
                      onChanged: (val) {
                        setState(() => code = val);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: newPasswordController,
                      decoration:
                          inputDecoration().copyWith(hintText: 'New Password'),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => newPassword = val);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
                      decoration: inputDecoration()
                          .copyWith(hintText: 'Confirm Password'),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => confirmPassword = val);
                      },
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    RaisedButton(
                      elevation: 0.0,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () async {
                        String response = _resetPassword(
                            codeController.text.toLowerCase().trim(),
                            widget.email,
                            newPasswordController.text.trim());
                        if(response == null){
                          _showSnackBar("error resetting the password");
                        }else{
                          _showSnackBar("Your Password have been changed");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      }},
                      child: Text('Reset'),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
