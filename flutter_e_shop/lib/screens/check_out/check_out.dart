import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_e_shop/constants/routes.dart';
import 'package:flutter_e_shop/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:flutter_e_shop/models/product_model/product_model.dart';
import 'package:flutter_e_shop/screens/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:flutter_e_shop/widgets/primary_button/primary_button.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class ChecktOut extends StatefulWidget {
  final ProductModel singleProduct;
  const ChecktOut({super.key, required this.singleProduct});

  @override
  State<ChecktOut> createState() => _ChecktOutState();
}

class _ChecktOutState extends State<ChecktOut> {
  int groupValue = 1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Check Out",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 36,
            ),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 3.0),
              ),
              child: Row(
                children: [
                  Radio(
                      value: 1,
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                      }),
                  Icon(Icons.money),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Cash On Delivery",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 3.0),
              ),
              child: Row(
                children: [
                  Radio(
                      value: 2,
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                      }),
                  Icon(Icons.money),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Pay Online",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            PrimaryButton(
              title: "Continues",
              onPressed: () async {
                appProvider.getBuyProductsList.clear();
                appProvider.addBuyProduct(widget.singleProduct);
                bool value = await FirebaseFirestoreHelper.instance
                    .uploadOrderedProductFirebase(
                        appProvider.getBuyProductsList, context,groupValue==1?"Cash On Delivery":"Paid");
                if(value){
                  Future.delayed(Duration(seconds: 2), (){
                    Routes.instance.push(widget: CustomBottomBar(), context: context);
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
