import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ora_app/Models/CountryResponseModel.dart';
import 'package:ora_app/Network/API.dart';

class CountryProvider with ChangeNotifier {
  bool loading = false;
  CountryResponse countryResponse = CountryResponse();
  List<String> myCountries = [];
  API api = API();
  String selectedCountry;

  Future<CountryResponse> getCountries() async {
    setLoading(true);
    try {
      myCountries.clear();
      Response response = await api.getCountries();

      if (response != null) {
        countryResponse = countryResponseFromJson(response.body);
        for (int i = 0; i < countryResponse.countries[0].values.length; i++) {
          myCountries
              .add(countryResponse.countries[0].values.elementAt(i).official);
        }

        setLoading(false);
        notifyListeners();
        return countryResponse;
      }
      setLoading(false);

      notifyListeners();
      return countryResponse;
    } catch (e) {
      notifyListeners();
      setLoading(false);
    }
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  setSelectedCountry(String selected) {
    selectedCountry = selected;
  }

  String getSelectedCountry() {
    return selectedCountry;
  }
}
