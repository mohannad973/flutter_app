import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:ora_app/Models/CategoryResponseModel.dart';
import 'package:ora_app/Models/diameters_model.dart';
import 'package:ora_app/Models/dias_info.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Network/API.dart';
import 'package:provider/provider.dart';

class DiasInfoProvider with ChangeNotifier{
  bool loading = false;
  API api = API();
  double diam;
  String surgColorCode;
  String prosColorCode;

  DiasInfoResponse diasInfoResponse =DiasInfoResponse();
  List<Length> lengths = [];
  // Tray tray = Tray();
  // Dias dias = Dias();

  Future <DiasInfoResponse>getDiasInfo(int diasId) async {

    try{
      Response response = await api.getDiasInfo(diasId);

      if (response != null) {
        diasInfoResponse = diasInfoResponseFromJson(response.body);
        // diameters = diametersResponse.dias.diameters;
        // tray =diametersResponse.dias.tray;
        // dias = diametersResponse.dias;
        lengths = diasInfoResponse.dia.lengths;

        setLoading(false);
        print("diasInfo"+diasInfoResponse.toString());
        return  diasInfoResponse;
      }else if(diasInfoResponse == null){

        setLoading(false);
        return diasInfoResponse;
      }

    }catch(e){
      print("error"+e.toString());
      setLoading(false);
      return diasInfoResponse;
    }

  }


  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }


  void setDiam(double diam) {
    this.diam = diam;
    notifyListeners();
  }

  double getDiam() {
    return diam;
  }


  void setSurgColrCode(String surgColor) {
    this.surgColorCode = surgColor;
    notifyListeners();
  }

  String getSurgColor() {
    return surgColorCode;
  }



  void setProsColor(String prosColor) {
    this.prosColorCode = prosColor;
    notifyListeners();
  }

  String getProsColor() {
    return prosColorCode;
  }


}