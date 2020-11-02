import 'package:flutter/foundation.dart';
import 'package:ora_app/Models/profile_response_model.dart';
import 'package:ora_app/Models/rigesterBody.dart';
import 'package:ora_app/Models/userModel.dart';
import 'package:ora_app/Network/API.dart';
import 'package:ora_app/Util/session_manager.dart';
import 'package:provider/provider.dart';

class RegisterProvider with ChangeNotifier {
  bool loading = false;
 UserModel userModel =UserModel();
 String token;
  API api = API();

  SessionManager sessionManager = SessionManager();

  Future<bool> register(RegisterBody registerBody) async {
    setLoading(true);
    try {

      //Todo DAta Connection Checker
      UserModel user = await api.register(registerBody);
      if (user != null) {
        userModel = user;
        notifyListeners();
        print("userprov"+user.toString());
        sessionManager.setAuthToken(user.token);
        token = userModel.token;
        // sessionManager.setUserID(user.userId.toString());
        setLoading(false);

        return true;
      }

      setLoading(false);
      return false;
    } catch (e) {
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
