import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:ora_app/Models/citiesResponseModel.dart';
import 'package:ora_app/Network/API.dart';

class CitiesProvider extends ChangeNotifier {
  bool loading = false;
  API api = API();
  List<String> cities = [];
  String selectedCity;

  Future<CitiesResponseModel> getCities(String country) async {
    setLoading(true);
    try {
      cities.clear();
      Response res = await api.getCities(country);
      CitiesResponseModel citiesResponseModel =
          citiesResponseModelFromJson(res.body);
      if (citiesResponseModel.cities.isNotEmpty) {
        for(int i = 0; i<citiesResponseModel.cities.length ; i++){
          cities.add(citiesResponseModel.cities[i]);
        }
        notifyListeners();
        setLoading(false);
        return citiesResponseModel;
      } else {
        cities.add("value");
        notifyListeners();
        setLoading(false);
        return citiesResponseModel;
      }
    } catch (e) {
      setLoading(false);
      return null;
    }
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  setSelectedCity(String selected) {
    selectedCity = selected;
  }

  String getSelectedCity() {
    return selectedCity;
  }
}
