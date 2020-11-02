// import 'package:flutter/foundation.dart';
// import 'package:ora_app/Models/StringSuccessResponse.dart';
// import 'package:ora_app/Models/userModel.dart';
// import 'package:ora_app/Network/API.dart';
// import 'package:ora_app/Util/session_manager.dart';
// import 'package:provider/provider.dart';
//
// class ForgotPasswordProvider with ChangeNotifier {
//   bool loading = false;
//
//   API api = API();
//
//
//   Future<bool> getCode(String email) async {
//     setLoading(true);
//     try {
//
//       //Todo DAta Connection Checker
//       StringSuccessResponse response = await api.forgotPassword(email);
//
//       if (response != null) {
//
//         setLoading(false);
//
//         return true;
//       }
//
//       setLoading(false);
//       return false;
//     } catch (e) {
//       setLoading(false);
//       return false;
//     }
//   }
//
//   void setLoading(bool value) {
//     loading = value;
//     notifyListeners();
//   }
//
//   bool isLoading() {
//     return loading;
//   }
//
// }
