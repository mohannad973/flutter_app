//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ora_app/Models/StringSuccessResponse.dart';
import 'package:ora_app/Utils/form_validators.dart';
import 'package:ora_app/reset_password.dart';
import 'package:ora_app/sign_in.dart';

import 'Network/API.dart';
import 'Utils/decorations.dart';
import 'home_page.dart';

final _forgetPasswordfFormKey = GlobalKey<FormState>();

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String email = '';
  String response;
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _getCode(String email) async {
    isLoading = true;

    try {
      API.forgotPassword(email.toLowerCase().trim()).then((response) {
        final String responseString = response.body;
        setState(() {
          response = successResponseFromJson(responseString);
          _showSnackBar();
        });
      });
      isLoading = false;
      return response;
    } catch (e) {
      isLoading = false;
      return null;
    }
  }

  _showSnackBar() {
    final snackBar = new SnackBar(
      content: new Text("The Code Has Been Sent"),
      duration: new Duration(seconds: 3),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          FlatButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignIn()),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.transparent,
            icon: Icon(
              Icons.person,
              color: Theme.of(context).cardColor,
            ),
            label: Text(
              "Sign In",
              style: TextStyle(
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
        ],
      ),
      body: signInUI(context),
    );
  }

  SingleChildScrollView signInUI(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // padding: EdgeInsets.fromLTRB(40.0, 80.0, 40.0, 0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(40.0, 80.0, 40.0, 0),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: double.infinity,
                  child: Text(
                    "Forgot Password ?",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _forgetPasswordfFormKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: emailValidator(email),
                      controller: emailController,
                      decoration: inputDecoration()
                          .copyWith(hintText: 'Registered Email Address'),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    isLoading
                        ? CircularProgressIndicator(
                            backgroundColor: Colors.teal,
                          )
                        : RaisedButton(
                            elevation: 0.0,
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () async {
                              if (_forgetPasswordfFormKey.currentState
                                  .validate()) {
                                setState(() {
                                  isLoading = true;
                                  response = _getCode(emailController.text);
                                });
                              }
                              _forgetPasswordfFormKey.currentState.save();
                            },
                            child: Text('Send Code'),
                            textColor: Colors.white,
                          ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        child: Divider(
                          height: 1,
                        ),
                      ),
                    ),
                    RaisedButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 40),
                      color: Theme.of(context).cardColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPassword(
                                    email: emailController.text
                                        .toLowerCase()
                                        .trim(),
                                  )),
                        )
                      },
                      elevation: 0,
                      child: Text(
                        'Reset Password',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
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
