import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_shop/constants/routes.dart';
import 'package:flutter_e_shop/provider/app_provider.dart';
import 'package:flutter_e_shop/screens/cart_screen/widgets/single_cart_item.dart';
import 'package:flutter_e_shop/screens/check_out/check_out.dart';
import 'package:flutter_e_shop/widgets/primary_button/primary_button.dart';
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
      bottomNavigationBar: SizedBox(
        height: 180,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    Text(
                      "\$${appProvider.totalPrice().toString()}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                ],
              ),
              SizedBox(height: 24,),
              PrimaryButton(title: "CheckOut",onPressed: (){
                // Routes.instance.push(widget: ChecktOut(), context: context);
              },)
            ],
          ),
        ),
      ),
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
