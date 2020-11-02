import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:ora_app/Models/CategoryResponseModel.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Network/API.dart';
import 'package:provider/provider.dart';

class ImplantProvider with ChangeNotifier{
  bool loading = false;
  API api = API();

  ImplantResponse implantResponse =ImplantResponse();

  List<Cat> cats = [];

  Future <List<Cat>>getImplants() async {
    try{
      Response response = await api.getImplants();
      implantResponse = implantResponseFromJson(response.body);
      cats = implantResponse.cats;
      if (cats.isNotEmpty) {

        setLoading(false);
        return cats;
      }
      setLoading(false);
      return cats;
    }catch(e){
      setLoading(false);
      return cats;
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