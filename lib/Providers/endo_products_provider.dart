import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:ora_app/Models/CategoryResponseModel.dart';
import 'package:ora_app/Models/diameters_model.dart';
import 'package:ora_app/Models/dias_info.dart';
import 'package:ora_app/Models/endo_products_response.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Network/API.dart';
import 'package:provider/provider.dart';

class EndoProductsProvider with ChangeNotifier{
  bool loading = false;
  API api = API();
  EndoProductResponse endoProductResponse =EndoProductResponse();
  List<EndoProduct> endoProducts = [];

  Future <EndoProductResponse>getEndoProducts(int endoCatId) async {
    setLoading(true);

    try{
      Response response = await api.getEndoProducts(endoCatId.toString());

      if (response != null) {
        endoProductResponse = endoProductResponseFromJson(response.body);

        endoProducts = endoProductResponse.endoProducts;

        setLoading(false);

        return  endoProductResponse;
      }else if(endoProductResponse == null){

        setLoading(false);
        return endoProductResponse;
      }

    }catch(e){
      print("error"+e.toString());
      setLoading(false);
      return endoProductResponse;
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