import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_shop/constants/routes.dart';
import 'package:flutter_e_shop/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:flutter_e_shop/models/category_model/category_model.dart';
import 'package:flutter_e_shop/models/product_model/product_model.dart';
import 'package:flutter_e_shop/screens/category_view/category_view.dart';
import 'package:flutter_e_shop/screens/product_details/product_details.dart';
import 'package:flutter_e_shop/widgets/top_titles/top_titles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoriesList = [];
  List<ProductModel> productModelList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getCategoryList();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    categoriesList = await FirebaseFirestoreHelper.instance.getCategories();
    productModelList = await FirebaseFirestoreHelper.instance.getBestProducts();
    productModelList.shuffle();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TopTitles(subtitle: "", title: "E Commerce"),
                        TextFormField(
                          decoration: InputDecoration(hintText: "Search...."),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  categoriesList.isEmpty
                      ? Center(
                          child: Text("Categories is Empty"),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: categoriesList
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: (){
                                        Routes.instance.push(widget: CategoryView(categoryModel: e), context: context);
                                      },
                                      child: Card(
                                        color: Colors.white,
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(e.image!),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, left: 12),
                    child: Text(
                      "Best Products",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  productModelList.isEmpty
                      ? Center(
                          child: Text("Best Products is Empty"),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GridView.builder(
                            padding: EdgeInsets.only(bottom: 50),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: productModelList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20,
                                    childAspectRatio: 0.7,
                                    crossAxisCount: 2),
                            itemBuilder: (ctx, index) {
                              ProductModel singleProduct =
                                  productModelList[index];
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Image.network(
                                      singleProduct.image!,
                                      height: 100,
                                      width: 100,
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      singleProduct.name!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("Price: \$${singleProduct.price}"),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    SizedBox(
                                      height: 45,
                                      width: 140,
                                      child: OutlinedButton(
                                        onPressed: () {
                                          Routes.instance.push(widget: ProductDetails(singleProduct: singleProduct), context: context);
                                        },
                                        child: Text("Buy"),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 12,
                          ),
                ],
              ),
            ),
    );
  }
}
