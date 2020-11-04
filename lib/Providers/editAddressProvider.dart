import 'package:flutter/foundation.dart';
import 'package:ora_app/Models/SignUpModel.dart';
import 'package:ora_app/Models/StringSuccessResponse.dart';
import 'package:ora_app/Models/add_addressBody.dart';
import 'package:ora_app/Network/API.dart';
import 'package:ora_app/Util/session_manager.dart';

class EditAddressInfoProvider extends ChangeNotifier {
  bool loading = false;
  String token;
  API api = API();
  bool edited = false;

  SuccessResponse successResponse = SuccessResponse();

  SessionManager sessionManager = SessionManager();

  Future<bool> editAddress(
      int id, AddAddressBody addAddressBody, String token) async {
    setLoading(true);

    try {
      SuccessResponse response =
          await api.editAddress(id, token, addAddressBody);
      if (response != null) {
        edited = true;
        successResponse = response;
        setLoading(false);
        notifyListeners();
        return true;
      } else {
        print('Response is null');
        edited = false;
        setLoading(false);
        return false;
      }
    } catch (e) {
      print('trdfvgasdisgdya' + e.toString());
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
