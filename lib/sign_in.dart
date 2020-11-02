import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ora_app/Providers/login_provider.dart';
import 'package:ora_app/Util/session_manager.dart';
import 'package:ora_app/Utils/Constants.dart';
import 'package:ora_app/forget_password_screen.dart';
import 'package:ora_app/home_page.dart';
import 'package:ora_app/register/register.dart';
import 'Providers/countries_providers.dart';
import 'file:///E:/hashtag%20progects/ora-master/lib/register/sign_up.dart';
import 'package:provider/provider.dart';
import 'Models/userModel.dart';
import 'Utils/form_validators.dart';
import 'bottom_navigation_bar.dart';
import 'Utils/decorations.dart';
import 'package:http/http.dart' as http;


class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String email = '';
  String password = '';
  String error = '';

//  bool loading = false;
  var mainProvider;
  final _logInFormKey = GlobalKey<FormState>();


  BuildContext scaffoldContext;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  UserModel _user;
  String token;
  SessionManager sessionManager = SessionManager();

  @override
  Widget build(BuildContext context) {
    mainProvider = Provider.of<LogInProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          FlatButton.icon(
            onPressed: () {
              Provider.of<CountryProvider>(context,listen: false).getCountries();

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Register()),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.transparent,
            icon: Icon(
              Icons.person_add,
              color: Theme.of(context).cardColor,
            ),
            label: Text(
              "Sign Up",
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
              Image.asset(
                'assets/ora1.png',
                height: 80,
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _logInFormKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: emailValidator(email),
                      controller: emailController,
                      decoration: inputDecoration().copyWith(hintText: 'Email'),
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: passwordValidator(),
                      controller: passwordController,
                      decoration:
                          inputDecoration().copyWith(hintText: 'Password'),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);

                      },
                        onSaved: (passwordValue)=> password = passwordValue,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Provider.of<LogInProvider>(context, listen: false)
                                  .isLoading()
                              ? CircularProgressIndicator(
                                  backgroundColor: Colors.teal,
                                )
                              : Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: RaisedButton(
                                    elevation: 0.0,
                                    color: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    onPressed: () async {
                                      if (_logInFormKey.currentState.validate()) {
                                        final String email =
                                            emailController.text.trim();
                                        final String password =
                                            passwordController.text.trim();
                                        final bool user =
                                            await Provider.of<LogInProvider>(
                                                    context,
                                                    listen: false)
                                                .logIn(email, password);
                                        SessionManager session = SessionManager();
                                        String t = await session.getAuthToken();

                                        if (user) {
                                          print("token test : "+t);

                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BottomBar()),
                                          );
                                        } else {
                                          createSnackBar("message");
                                          print("wrong");
                                          // Scaffold.of(context).showSnackBar(SnackBar(content: Text("Wrong"),));
                                        }
                                      }
                                      _logInFormKey.currentState.save();
                                    },
                                    child: Text('Sign In'),
                                    textColor: Colors.white,
                                  ),
                                ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: FlatButton(
                                onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ForgetPassword(),
                                      ))
                                },
                                color: Colors.transparent,
                                child: AutoSizeText(
                                  'Forgot your Password?',
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        child: Divider(
                          height: 1,
                        ),
                      ),
                    ),
                    Text(
                      'OR',
                      style: TextStyle(color: Colors.black54),
                    ),
                    RaisedButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 40),
                      color: Theme.of(context).cardColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () => {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => BottomBar()),
                        )
                      },
                      elevation: 0,
                      child: Text(
                        'Log in As guest',
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

  void createSnackBar(String message) {
    final snackBar =
        new SnackBar(content: new Text(message), backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    Scaffold.of(scaffoldContext).showSnackBar(snackBar);
  }
}
