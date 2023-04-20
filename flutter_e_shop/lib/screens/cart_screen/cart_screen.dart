import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_shop/provider/app_provider.dart';
import 'package:flutter_e_shop/screens/cart_screen/widgets/single_cart_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Cart Screen",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body:appProvider.getCartProductList.isEmpty ? Center(child: Text("Empty"),) : ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: appProvider.getCartProductList.length,
          itemBuilder: (ctx, index) {
            return SingleCartItems(singleProduct: appProvider.getCartProductList[index],);
          }),
    );
  }
}
