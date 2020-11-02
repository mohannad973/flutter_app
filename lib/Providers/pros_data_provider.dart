import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:ora_app/Models/CategoryResponseModel.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Models/prosthetic_by_cat_response.dart';
import 'package:ora_app/Models/prosthetic_cat_response.dart';
import 'package:ora_app/Network/API.dart';
import 'package:provider/provider.dart';

class ProsDataProvider with ChangeNotifier{
  bool loading = false;
  API api = API();

  ProstheticByCatResponse prostheticByCatResponse =ProstheticByCatResponse();


  Future <ProstheticByCatResponse>getProsData(String id,int page) async {
    print("provider data getting");
    try{
      Response response = await api.getProsData(id, page);
      prostheticByCatResponse = prostheticByCatResponseFromJson(response.body);
      notifyListeners();

      print("*********"+prostheticByCatResponse.toString());
      if (prostheticByCatResponse != null) {

        setLoading(false);
        return prostheticByCatResponse;
      }
      setLoading(false);
      return prostheticByCatResponse;
    }catch(e){
      setLoading(false);
      return prostheticByCatResponse;
    }

  }


  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }


  ProstheticByCatResponse getProsByCatData() {
    return prostheticByCatResponse;
  }

}

