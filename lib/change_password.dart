import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ora_app/Models/ChangePassordResponse.dart';
import 'package:ora_app/Models/ChangePasswordBody.dart';
import 'package:ora_app/Models/rigesterBody.dart';
import 'package:ora_app/home_page.dart';
import 'package:ora_app/profile.dart';
import 'file:///E:/hashtag%20progects/ora-master/lib/register/sign_up.dart';
import 'package:provider/provider.dart';
import 'My_Addresses.dart';
import 'Network/API.dart';
import 'Providers/change_password_provider.dart';
import 'Utils/form_validators.dart';
import 'app_bar.dart';
import 'Utils/decorations.dart';
import 'package:http/http.dart'as http;

String oldPassword = '';
String newPassword = '';
String confirmPassword = '';
String error = '';
bool response;
bool loading = false;
final _formKey = GlobalKey<FormState>();

FocusNode _oldPasswordFocusNode = FocusNode();
FocusNode _newPasswordlFocusNode = FocusNode();
FocusNode _confirmPasswordFocusNode = FocusNode();

final TextEditingController oldPasswordController = TextEditingController();
final TextEditingController newPasswordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();



class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {




  // _changePassword(ChangePasswordBody changePasswordBody) async{
  //   String responseCode;
  //   debugPrint('channgebodyis: ${changePasswordBody.user_id}'+'${changePasswordBody.old_password}'+'${changePasswordBody.new_password}');
  //
  //
  //   API.changePassword(changePasswordBody).then((response) {
  //
  //
  //     debugPrint('changeresponse: ${response}');
  //     final String responseString = response.body;
  //     setState(() {
  //       responseCode = response.body;
  //     });
  //   });
  //   return responseCode;
  //   //print(categories[0].engName);
  // }




  Future<ChangePasswordResponse> changePassword(ChangePasswordBody changePasswordBody) async{
    debugPrint('channgebodyis: ${changePasswordBody.user_id}'+'${changePasswordBody.old_password}'+'${changePasswordBody.new_password}');
    final String apiUrl = "http://ora.hashtagweb.online/api/changePassword";
    final response = await http.post(apiUrl,body:{
      "user_id":changePasswordBody.user_id,
      "old_password":changePasswordBody.old_password,
      "new_password":changePasswordBody.new_password,

    } );

    debugPrint('myStatusCode: ${response.statusCode.toString()}');

    if(response.statusCode==200){
      debugPrint('if200: ${response.statusCode.toString()}');
      final String responseString = response.body;
      return changePasswordResponseFromJson(responseString);

    }else{
      debugPrint('if400: ${response.statusCode.toString()}');
      return null;
    }

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(


        appBar: topBar (context , barWithBack(context) , Text ('Ora'),barWithSearch(context)),
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
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                  oldPasswordInput(),
                    SizedBox(
                      height: 30,
                    ),
                    newPasswordInput(),
                    SizedBox(
                      height: 30,
                    ),
                  confirmPasswordInput(),
                    SizedBox(
                      height: 60,
                    ),
                  Provider.of<ChangePasswordProvider>(context).loading? CircularProgressIndicator(backgroundColor: Colors.teal,):
                  changeButton(context)
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


Widget oldPasswordInput() {
  return TextFormField(
    controller: oldPasswordController,
    focusNode: _oldPasswordFocusNode,
    keyboardType: TextInputType.text ,
    obscureText: true,
    decoration: passwordDecoration(),
    textInputAction: TextInputAction.done,
    validator:passwordValidator(),
    onSaved: (password)=> oldPassword = password,
  );
}

Widget newPasswordInput() {
  return TextFormField(
    controller: newPasswordController,
    focusNode: _newPasswordlFocusNode,
    keyboardType: TextInputType.text ,
    obscureText: true,
    decoration: passwordDecoration(),
    textInputAction: TextInputAction.done,
    validator:passwordValidator(),
    onSaved: (password)=> newPassword = password,
  );
}


Widget confirmPasswordInput() {
  return TextFormField(
    controller: confirmPasswordController,
    focusNode: _confirmPasswordFocusNode,
    keyboardType: TextInputType.text ,
    obscureText: true,
    decoration: passwordDecoration(),
    textInputAction: TextInputAction.done,
    validator:matchPasswordValidator(newPasswordController.text),
    onSaved: (password)=> confirmPassword = password,
  );
}

Widget changeButton(BuildContext context){
  return RaisedButton(
    elevation: 0.0,
    color: Theme.of(context).primaryColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)),
    onPressed: () async {
      if(_formKey.currentState.validate()){

        Future<String> userId = sessionManager.getUserId();
        userId.then((data) {
          print("userId " + data.toString());
        },onError: (e) {
          print(e);
        });
        String sId = await userId;


        ChangePasswordBody changeBody= new ChangePasswordBody(
            user_id: sId,
            old_password:oldPasswordController.text,
            new_password: newPasswordController.text );
        response = await Provider.of<ChangePasswordProvider>(context,listen: false).changePassword(oldPasswordController.text, newPasswordController.text, sId);
        if(response){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profile()),

          );}else{
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("test"),
          ));
        }

        _formKey.currentState.save();

      }
      toastMessage("Username: $oldPassword\nEmail: $newPassword\nPassword: $oldPassword");
    },
    child: Text('Change Password'),
    textColor: Colors.white,
  );
}


void toastMessage(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      fontSize: 16.0
  );
}

void fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}