import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:ora_app/Models/CategoryResponseModel.dart';
import 'package:ora_app/Models/diameters_model.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Network/API.dart';
import 'package:provider/provider.dart';

class DiametersProvider with ChangeNotifier{
  bool loading = false;
  API api = API();

  DiametersResponse diametersResponse =DiametersResponse();

 List<Diameter> diameters = [];
 Tray tray = Tray();
 Dias dias = Dias();

  Future <DiametersResponse>getDias(int implantId) async {
    diameters.clear();

    print("");
    try{
      Response response = await api.getDiameters(implantId);

      if (diametersResponse != null) {
        diametersResponse = diametersResponseFromJson(response.body);
        diameters = diametersResponse.dias.diameters;
        tray =diametersResponse.dias.tray;
        dias = diametersResponse.dias;
        setLoading(false);
        print("mohannad"+diametersResponse.toString());
        return  diametersResponse;
      }else if(diametersResponse == null){
        print("555555");
        setLoading(false);
        return diametersResponse;
      }

    }catch(e){
      print("mohannad"+e.toString());
      setLoading(false);
      return diametersResponse;
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