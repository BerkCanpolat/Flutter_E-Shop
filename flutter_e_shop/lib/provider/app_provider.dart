import 'package:flutter/material.dart';
import 'package:flutter_e_shop/models/product_model/product_model.dart';

class AppProvider with ChangeNotifier {
  List<ProductModel> _cartProductList = [];

  void addCardProduct(ProductModel productModel){
    _cartProductList.add(productModel);
    notifyListeners();
  }

  void removeCardProduct(ProductModel productModel){
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getCartProductList => _cartProductList;
}