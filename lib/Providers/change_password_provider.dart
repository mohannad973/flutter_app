import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:ora_app/Models/ChangePasswordBody.dart';
import 'package:ora_app/Models/StringSuccessResponse.dart';
import 'package:ora_app/Models/userModel.dart';
import 'package:ora_app/Network/API.dart';
import 'package:ora_app/Util/session_manager.dart';
import 'package:provider/provider.dart';

class ChangePasswordProvider with ChangeNotifier {
  bool loading = false;

  API api = API();

  SessionManager sessionManager = SessionManager();

  Future<bool> changePassword(String oldpassword, String newPassword,String userId) async {
    setLoading(true);
    try {

      //Todo DAta Connection Checker
      Response response = await api.changePassword(ChangePasswordBody(old_password: oldpassword,new_password: newPassword,user_id: userId));

      print("Status code ///////////////// " + "${response.statusCode}");
      print("1111111111111111111111111 " + "${oldpassword}");
      print("222222222222222222222222" + "${newPassword}");
      print("333333333333333333333333" + "${userId.toString()}");

      if (response .statusCode==200) {

        setLoading(false);

        return true;
      }

      setLoading(false);
      return false;
    } catch (e) {
      print("///////////////////////////////////"+e.toString());
      setLoading(false);
      return false;
    }
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

}