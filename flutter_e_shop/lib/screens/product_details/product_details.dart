import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_shop/constants/constant.dart';
import 'package:flutter_e_shop/constants/routes.dart';
import 'package:flutter_e_shop/models/product_model/product_model.dart';
import 'package:flutter_e_shop/provider/app_provider.dart';
import 'package:flutter_e_shop/screens/check_out/check_out.dart';
import 'package:flutter_e_shop/screens/cart_screen/cart_screen.dart';
import 'package:flutter_e_shop/screens/favourite_screen/favourite_screen.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({super.key, required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  int qty = 1;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context,);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Routes.instance.push(widget: CartScreen(), context: context);
          }, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.singleProduct.image!,height: 200,width: 200,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                widget.singleProduct.name!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                ),
                IconButton(
                  onPressed: (){
                    setState(() {
                      widget.singleProduct.isFavourite =  !widget.singleProduct.isFavourite!;
                    });
                    if(widget.singleProduct.isFavourite!){
                      appProvider.addFavouriteProduct(widget.singleProduct);
                    }else{
                      appProvider.removeFavouriteProduct(widget.singleProduct);
                    }
                  }, 
                  icon: Icon(appProvider.getFavouriteProductList.contains(widget.singleProduct)
                  ? Icons.favorite
                  :  Icons.favorite_border
                    ),
                  ),
              ],
            ),
            Text(widget.singleProduct.description!),
            SizedBox(height: 12,),
            Row(
              children: [
                CupertinoButton(
                  onPressed: (){
                    if(qty >= 1){
                      setState(() {
                        qty--;
                      });
                    }
                  },
                  padding: EdgeInsets.zero,
                  child: CircleAvatar(
                    child: Icon(Icons.remove),
                  ),
                ),
                SizedBox(width: 12,),
                Text(qty.toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(width: 12,),
                CupertinoButton(
                  onPressed: (){
                    setState(() {
                      qty++;
                    });
                  },
                  padding: EdgeInsets.zero,
                  child: CircleAvatar(
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: (){
                    ProductModel productModel = widget.singleProduct.copyWith(qty: qty);
                    appProvider.addCardProduct(productModel);
                    showMessage("Added to Cart");
                  }, 
                  child: Text("ADD TO CART"),
                ),
                SizedBox(width: 24,),
                SizedBox(
                  height: 38,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: (){
                    ProductModel productModel = widget.singleProduct.copyWith(qty: qty);
                    appProvider.addCardProduct(productModel);
                      Routes.instance.push(widget: ChecktOut(singleProduct: productModel), context: context);
                    }, 
                    child: Text("BUY"),
                    ),
                ),
              ],
            ),
            SizedBox(height: 54,),
          ],
        ),
      ),
    );
  }
}