import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:ora_app/Models/CategoryResponseModel.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Models/profile_response_model.dart';
import 'package:ora_app/Network/API.dart';
import 'package:provider/provider.dart';

class ProfileProvider with ChangeNotifier{
  bool loading = false;
  API api = API();

  ProfileResponse profileResponse =ProfileResponse();

  List<Address> addresses = [];
  User user = User();

  Future <ProfileResponse>getProfile(String token) async {
    try{
      Response response = await api.getProfile(token);

      if (profileResponse!=null) {
        profileResponse = profileResponseFromJson(response.body);
        addresses = profileResponse.user.addresses;
        for(int i = 0; i< addresses.length ; i++){
          print("last address : "+i.toString()+"  "+addresses[i].toString());
        }

        user = profileResponse.user;
        setLoading(false);
        return profileResponse;
      }
      setLoading(false);
      return profileResponse;
    }catch(e){
      setLoading(false);
      return profileResponse;
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