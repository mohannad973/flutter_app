import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:ora_app/Models/CategoryResponseModel.dart';
import 'package:ora_app/Network/API.dart';
import 'package:provider/provider.dart';

class CategoriesProvider with ChangeNotifier{
  bool loading = false;
  API api = API();

  List <CategoryResponseModel> categoryList = [];

  Future <List<CategoryResponseModel>>getCategories() async {
    try{
    Response response = await api.getCategories();
    categoryList = categoryResponseModelFromJson(response.body);
    if (categoryList.isNotEmpty) {

      setLoading(false);
      return categoryList;
    }
    setLoading(false);
    return categoryList;
    }catch(e){
      setLoading(false);
      return categoryList;
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