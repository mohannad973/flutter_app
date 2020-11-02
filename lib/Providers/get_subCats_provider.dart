import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:ora_app/Models/SubCategoryResponse.dart';
import 'package:ora_app/Models/SubCats.dart';
import 'package:ora_app/Models/userModel.dart';
import 'package:ora_app/Network/API.dart';
import 'package:ora_app/Util/session_manager.dart';
import 'package:provider/provider.dart';

class SubCategoryProvider with ChangeNotifier {
  bool loading = true;
  API api = API();

  List<SubCategory> subCategoryResponse = [];

 Future<List<SubCategory>> getSubCategories({int id }) async {
   setLoading(true);
   try {

     //Todo DAta Connection Checker
     Response  res = await api.getSubCategories();
     SubCategoryResponse subCats = subCategoryResponseFromJson(res.body);
     print(subCats.subCategories.length);
     if (subCats.subCategories.isNotEmpty) {

       subCategoryResponse =(subCats.subCategories);
       setLoading(false);
       return subCategoryResponse;
     }

     setLoading(false);
     return subCategoryResponse;
   } catch (e) {

      print(e);
     setLoading(false);
     return subCategoryResponse;
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
