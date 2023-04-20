import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_e_shop/constants/constant.dart';
import 'package:flutter_e_shop/models/product_model/product_model.dart';
import 'package:flutter_e_shop/provider/app_provider.dart';
import 'package:provider/provider.dart';

class SingleCartItems extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleCartItems({super.key, required this.singleProduct});

  @override
  State<SingleCartItems> createState() => _SingleCartItemsState();
}

class _SingleCartItemsState extends State<SingleCartItems> {
  int qty = 1;

  @override
  void initState() {
    super.initState();
    setState(() {
    qty = widget.singleProduct.qty??1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red, width: 3),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 140,
              color: Colors.red.withOpacity(0.5),
              child: Image.network(widget.singleProduct.image!),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 140,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.singleProduct.name!,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                CupertinoButton(
                                  onPressed: () {
                                    if (qty >= 1) {
                                      setState(() {
                                        qty--;
                                      });
                                    }
                                  },
                                  padding: EdgeInsets.zero,
                                  child: CircleAvatar(
                                    maxRadius: 13,
                                    child: Icon(Icons.remove),
                                  ),
                                ),
                                Text(
                                  qty.toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                CupertinoButton(
                                  onPressed: () {
                                    setState(() {
                                      qty++;
                                    });
                                  },
                                  padding: EdgeInsets.zero,
                                  child: CircleAvatar(
                                    maxRadius: 13,
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              child: Text(
                                "Add to wishlist",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$${widget.singleProduct.price.toString()}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                    AppProvider appProvider = Provider.of<AppProvider>(context,listen: false);
                    appProvider.removeCardProduct(widget.singleProduct);
                    showMessage("Removed from Card");
                      },
                      child: CircleAvatar(
                        maxRadius: 13,
                        child: Icon(
                          Icons.delete,
                          size: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
