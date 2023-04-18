import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_shop/models/product_model/product_model.dart';

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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
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
                  }, 
                  icon: Icon(widget.singleProduct.isFavourite!
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
                  onPressed: (){}, 
                  child: Text("ADD TO CART"),
                ),
                SizedBox(width: 24,),
                SizedBox(
                  height: 38,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: (){}, 
                    child: Text("BUY"),
                    ),
                ),
              ],
            ),
            SizedBox(height: 24,),
          ],
        ),
      ),
    );
  }
}