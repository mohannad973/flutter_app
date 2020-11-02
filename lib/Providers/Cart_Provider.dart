import 'package:flutter/cupertino.dart';
import 'package:ora_app/Models/cartModel.dart';
import 'package:ora_app/Util/session_manager.dart';

class CartProvider with ChangeNotifier {
  bool loading = false;
  SessionManager sessionManager = SessionManager();
  List<Cart> _cartList = [];
  double _totalPrice = 0;
  CartModel cartModel = CartModel();

  getCart() async {
    try {
      Future<CartModel> cart = sessionManager.getCart();
      cart.then((data) {
        _cartList = data.carts;

        notifyListeners();
      }, onError: (e) {
        print(e);
      });
    } catch (e) {}
  }

  void saveCart() {
    try {
      cartModel.carts = _cartList;
      sessionManager.setCart(cartModel);
    } catch (e) {}
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  void add(Cart cartItem) {
    int index = contains(cartItem);
    if (index == -1) {
      _cartList.add(cartItem);
    } else {
      _cartList[index].count += 1;
    }

    _totalPrice += cartItem.price;
    notifyListeners();
  }

  void remove(Cart cartItem) {
    _totalPrice -= cartItem.price;
    _cartList.remove(cartItem);
    this.saveCart();
    notifyListeners();
  }

  void modifyIncrease(Cart cartItem, int count) {
    int index = contains(cartItem);
    if (index == -1) {
      _cartList[index].count = count;
      _totalPrice = _totalPrice + cartItem.price;

    } else {
      _cartList[index].count += count;
      _totalPrice = _totalPrice + cartItem.price;
    }
    this.saveCart();
    notifyListeners();
  }

  void modifyDecrease(Cart cartItem, int count) {
    int index = contains(cartItem);
    if (index == -1) {
      _cartList[index].count = count;
      _totalPrice = _totalPrice - cartItem.price;

    } else {
      _cartList[index].count += count;
      _totalPrice = _totalPrice - cartItem.price;
    }
    this.saveCart();
    notifyListeners();
  }

  void removeAtIndex(int index) {
    _totalPrice -= _cartList[index].price;
    _cartList.removeAt(index);
    this.saveCart();
    notifyListeners();
  }

  int get count {
    return _cartList.length;
  }

  int get_productCount(Cart cartItem) {
    int index = contains(cartItem);
    if (index == -1) {
    } else {
      return _cartList[index].count;
    }
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<Cart> get basketCarts {
    return _cartList;
  }

  int contains(Cart cart) {
    for (int i = 0; i < _cartList.length; i++) {
      if (cart.id == _cartList[i].id) {
        return i;
      }
    }
    return -1;
  }
}
