

import 'package:flutter/foundation.dart';
import 'package:ora_app/Models/StringSuccessResponse.dart';
import 'package:ora_app/Models/add_addressBody.dart';
import 'package:ora_app/Models/profile_response_model.dart';
import 'package:ora_app/Models/rigesterBody.dart';
import 'package:ora_app/Models/userModel.dart';
import 'package:ora_app/Network/API.dart';
import 'package:ora_app/Util/session_manager.dart';
import 'package:provider/provider.dart';

class AddAddressProvider with ChangeNotifier {
  bool loading = false;
  String token;
  API api = API();
  bool added = false;
  SuccessResponse successResponse = SuccessResponse();

  SessionManager sessionManager = SessionManager();

  Future<bool> addAddress(AddAddressBody addressBody ,String token) async {
    print("add Address function");
    setLoading(true);
    try {

      print("add Address function 1");
      SuccessResponse response = await api.addAddress(addressBody ,token);
      if (response != null) {
        print("add Address function 2");
        added= true;
        successResponse = response;
        print("add Address function 5 "+successResponse.toString());
        setLoading(false);
        added= true;
        notifyListeners();
        return true;
      }

      print("add Address function 3");
      setLoading(false);
      return false;
    } catch (e) {
      print("add Address function 4 "+e.toString());
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
