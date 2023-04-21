import 'package:flutter/material.dart';
import 'package:flutter_e_shop/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:flutter_e_shop/models/product_model/product_model.dart';
import 'package:flutter_e_shop/models/user_model/user_model.dart';

class AppProvider with ChangeNotifier {

  List<ProductModel> _cartProductList = [];
  UserModel? _userModel;

  UserModel get getUserInformation => _userModel!;

  void addCardProduct(ProductModel productModel){
    _cartProductList.add(productModel);
    notifyListeners();
  }

  void removeCardProduct(ProductModel productModel){
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getCartProductList => _cartProductList;





  List<ProductModel> _cartFavouriteList = [];

  void addFavouriteProduct(ProductModel productModel){
    _cartFavouriteList.add(productModel);
    notifyListeners();
  }

  void removeFavouriteProduct(ProductModel productModel){
    _cartFavouriteList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getFavouriteProductList => _cartFavouriteList;



  void getUserInfoFirebase() async{
   _userModel = await FirebaseFirestoreHelper.instance.getUserInformation();
   notifyListeners();
  }
    
}