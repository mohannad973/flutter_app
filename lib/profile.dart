import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ora_app/My_Addresses.dart';
import 'package:ora_app/Providers/login_provider.dart';
import 'package:ora_app/Providers/register_provider.dart';
import 'package:ora_app/change_password.dart';
import 'package:ora_app/existing_cards.dart';
import 'package:ora_app/proceed_payment.dart';
import 'package:ora_app/register/register.dart';
import 'package:ora_app/sign_in.dart';
import 'package:provider/provider.dart';
import 'Models/profile_response_model.dart';
import 'Providers/profile_provider.dart';
import 'Util/session_manager.dart';
import 'app_bar.dart';
import 'bottom_navigation_bar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

SessionManager sessionManager = SessionManager();

class _ProfileState extends State<Profile> {
  User user = User();
  String token;

  String _getToken() {
    if (Provider.of<LogInProvider>(context).token != null) {
      token = Provider.of<LogInProvider>(context).token;
    }
    if (Provider.of<RegisterProvider>(context).token != null) {
      token = Provider.of<RegisterProvider>(context).token;
    }
    if (Provider.of<LogInProvider>(context).token == null &&
        Provider.of<RegisterProvider>(context).token == null) {
      token = null;
    }
    return token;
    // String t ;
    // Future<String> authToken = sessionManager.getAuthToken();
    // authToken.then((data) {
    //   print("authToken " + data.toString());
    // }, onError: (e) {
    //   print(e);
    // });
    // token = await authToken;
    // return t;
  }

  @override
  Future<void> initState() {
    //addressesList.clear();
    // _getToken();
  }

  @override
  Widget build(BuildContext context) {
    // print("profile token "+token);
    // print("profile token 2"+token);
    print("rebuilt");
    print("ttt " + (_getToken().toString()));
    // _getToken();
    token = Provider.of<LogInProvider>(context).token;
    if (token == null) {
      token = Provider.of<RegisterProvider>(context).token;
    }
    return Scaffold(

        // appBar: topBar(context, barWithBack(context), Text ('Profile'),Text('')),
        // bottomNavigationBar: BottomBar(),
        body: token == null
            ? SignIn()
            : FutureBuilder(
                future: Provider.of<ProfileProvider>(context, listen: false)
                    .getProfile(token),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    user = snapshot.data.user;
                    if (user != null) {
                      print("userInfo" + user.toString());
                      return profileBodyWidget(user);
                    }
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.teal,
                  ));
                },
              ));
  }

  Widget profileBodyWidget(User user) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Center(
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Ora Company',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '+96391291291',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      user.email,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        letterSpacing: 1,
                                      ),
                                    ))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 3,
                        child: Container(
                          height: 100,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          maxRadius: MediaQuery.of(context).size.height * 0.06,
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/logo.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChangePassword()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.security,
                  color: Theme.of(context).primaryColor,
                  size: 27,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.subscriptions,
                  color: Theme.of(context).primaryColor,
                  size: 27,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Subscribe to newsletter',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyAddresses(
                        addressList:
                            Provider.of<ProfileProvider>(context).addresses,
                      )),
            );
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.location_city,
                    color: Theme.of(context).primaryColor,
                    size: 27,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'My Addresses',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProceedPayment()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.payment,
                  color: Theme.of(context).primaryColor,
                  size: 27,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Payment',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
