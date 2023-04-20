import 'package:flutter/material.dart';
import 'package:flutter_e_shop/provider/app_provider.dart';
import 'package:flutter_e_shop/screens/cart_screen/widgets/single_cart_item.dart';
import 'package:flutter_e_shop/screens/favourite_screen/widget/single_favourite_item.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Favourite Screen",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: appProvider.getFavouriteProductList.isEmpty
          ? Center(
              child: Text("Empty"),
            )
          : ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: appProvider.getFavouriteProductList.length,
              itemBuilder: (ctx, index) {
                return SingleFavouriteItems(
                  singleProduct: appProvider.getFavouriteProductList[index],
                );
              }),
    );
  }
}
