import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:ora_app/Models/CategoryResponseModel.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Models/prosthetic_cat_response.dart';
import 'package:ora_app/Network/API.dart';
import 'package:provider/provider.dart';

class ProsProvider with ChangeNotifier{
  bool loading = false;
  API api = API();

  ProstheticCategoryResponse prostheticCategoryResponse =ProstheticCategoryResponse();

  int selectedId = 1;

  List<ProsCat> prosCatList = [];

  Future <ProstheticCategoryResponse>getProsCat() async {
    try{
      Response response = await api.getProstheticCat();
      prostheticCategoryResponse = prostheticCategoryResponseFromJson(response.body);
      prosCatList = prostheticCategoryResponse.prosCat;
      if (prosCatList.isNotEmpty) {

        setLoading(false);
        return prostheticCategoryResponse;
      }
      setLoading(false);
      return prostheticCategoryResponse;
    }catch(e){
      setLoading(false);
      return prostheticCategoryResponse;
    }

  }


  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }



  void setSelectedId(int value) {
    selectedId = value;
    notifyListeners();
  }

  int getSelectedId() {
    return selectedId;
  }
}

