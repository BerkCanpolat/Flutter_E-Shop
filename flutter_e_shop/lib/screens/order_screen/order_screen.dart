import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_e_shop/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:flutter_e_shop/models/order_model/order_model.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Your Orders",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestoreHelper.instance.getUserOrder(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.data!.isEmpty ||
              snapshot.data == null ||
              !snapshot.hasData) {
            return Center(
              child: Text("No Order Found"),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              OrderModel orderModel = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  collapsedShape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.red, width: 2.3)),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.red, width: 2.3),
                  ),
                  title: Row(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        color: Colors.red.withOpacity(0.5),
                        child: Image.network(orderModel.products[0].image!),
                      ),
                      Container(
                        height: 140,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                orderModel.products[0].name!,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              orderModel.products.length > 1
                                  ? SizedBox.fromSize()
                                  : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Quanity: \$${orderModel.products[0].qty.toString()}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Total Price: \$${orderModel.totalPrice.toString()}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                      ],
                                    ),
                              Text(
                                "Order Status : ${orderModel.status}",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  children: orderModel.products.length > 1
                      ? orderModel.products.map((e) {
                        return Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                color: Colors.red.withOpacity(0.5),
                                child: Image.network(
                                    e.image!),
                              ),
                              Container(
                                height: 140,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.name!,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Column(
                                              children: [
                                                Text(
                                                  "Quanity: \$${e.qty.toString()}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Price: \$${e.price.toString()}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                              ],
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                      }).toList()
                      : [],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
