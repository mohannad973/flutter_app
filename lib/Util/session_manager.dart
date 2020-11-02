import 'package:ora_app/Models/cartModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String auth_token = "auth_token";


//set data into shared preferences like this
  Future<void> setAuthToken(String auth_token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.auth_token, auth_token);
  }

//get value from shared preferences
  Future<String> getAuthToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String auth_token;
    auth_token = pref.getString(this.auth_token) ?? null;
    return auth_token;
  }

  final String userId="user_id";
  Future<void> setUserID(String userID) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.userId, userID);
  }

  Future<String> getUserId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String userID;
    userID = pref.getString(this.userId) ?? null;
    return userID;
  }

  final String cart = "CART";
  setCart(CartModel cartModel)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String cart = cartToJson(cartModel);
    prefs.setString(this.cart, cart);
  }

  Future<CartModel> getCart() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    CartModel cart = CartModel();
    String stringCart ;
    stringCart = pref.getString(this.cart) ?? null;
    cart = cartFromJson(stringCart);
    return cart;
  }

  final String firstTime="FisrstTime";

  Future <void> setFirstTime(bool value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(this.firstTime, value);
  }

  Future<bool> getFirstTime() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool isFirst;
    isFirst = pref.getBool(this.firstTime) ?? null;
    return isFirst;
  }


}