import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:ora_app/Models/CategoryResponseModel.dart';
import 'package:ora_app/Models/diameters_model.dart';
import 'package:ora_app/Models/dias_info.dart';
import 'package:ora_app/Models/endo_category_response.dart';
import 'package:ora_app/Models/endo_products_response.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Network/API.dart';
import 'package:provider/provider.dart';

class EndoCatsProvider with ChangeNotifier{
  bool loading = false;
  API api = API();
  EndoCategoryResponse endoCategoryResponse =EndoCategoryResponse();
  List<EndoCat> endoCats = [];

  Future <EndoCategoryResponse>getEndoCat() async {

    try{
      Response response = await api.getEndoCats();

      if (response != null) {
        endoCategoryResponse = endoCategoryResponseFromJson(response.body);

        endoCats = endoCategoryResponse.cats;

        setLoading(false);

        return  endoCategoryResponse;
      }else if(endoCategoryResponse == null){

        setLoading(false);
        return endoCategoryResponse;
      }

    }catch(e){
      print("error"+e.toString());
      setLoading(false);
      return endoCategoryResponse;
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