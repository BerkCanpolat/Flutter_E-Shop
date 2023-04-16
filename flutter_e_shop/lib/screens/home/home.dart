import 'package:flutter/material.dart';
import 'package:flutter_e_shop/models/product_model/product_model.dart';
import 'package:flutter_e_shop/widgets/top_titles/top_titles.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoriesList
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Card(
                          color: Colors.white,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.network(e),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12,left: 12),
              child: Text(
                "Best Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                itemCount: bestProducts.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.9,
                      crossAxisCount: 2
                      ),
                itemBuilder: (ctx, index) {
                  ProductModel singleProduct = bestProducts[index];
                  return Container(
                    decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          singleProduct.image,
                          height: 60,
                          width: 60,
                          ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          singleProduct.name,
                          style:
                              TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                ),
                        ),
                        Text("Price: \$${singleProduct.price}"),
                        SizedBox(height: 30.0,),
                        SizedBox(
                          height: 45,
                          width: 140,
                          child: OutlinedButton(
                            onPressed: (){}, 
                            child: Text("Buy"),
                            ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> categoriesList = [
  "https://static.vecteezy.com/system/resources/previews/009/345/591/original/stir-fry-salad-with-sushi-and-shrimps-in-a-bowl-with-a-slate-background-top-view-copy-space-shrimp-and-vegetables-served-with-salad-chopsticks-with-asian-food-vector-free-png.png",
  "https://cdn.pixabay.com/photo/2016/03/31/21/15/bread-1296280_960_720.png",
  "https://png.pngtree.com/png-vector/20220712/ourmid/pngtree-illustration-of-mie-meatballs-indonesian-traditional-food-png-image_5890499.png",
  "https://www.nicepng.com/png/full/168-1681394_food-vegetables-fruits-and-sweets-vector-png-different.png",
  "https://www.nicepng.com/png/full/20-204281_fast-food-veggie-burger-junk-vector-handpainted-fast.png",
];

List<ProductModel> bestProducts = [
  ProductModel(
      image:
          "https://purepng.com/public/uploads/large/purepng.com-bananafruitsyellowfruitbanana-981524754691bawpo.png",
      id: "1",
      name: "Banana",
      price: "1",
      description:
          "This is good banana fot health you can eat it. Türkiyede pahalı burda ucuz.",
      status: "pending",
      isFavourite: false),
  ProductModel(
      image:
          "https://www.theproducemoms.com/wp-content/uploads/2022/02/Dragon-Fruit-1.png",
      id: "2",
      name: "Dragon Fruit",
      price: "2",
      description:
          "This is good Dragon Fruit fot health you can eat it. Saray Sever :)",
      status: "pending",
      isFavourite: false),
  ProductModel(
      image:
          "https://www.fruitsmith.com/pub/media/catalog/product/cache/3d1197b96d84cacc4f40a78b1d94d82b/g/a/gala-apple-2_1.png",
      id: "3",
      name: "Apple",
      price: "3",
      description:
          "Elma Lan işte ne açıklaması yapıcam uzun uzun burayı doldurcaz mecbur sonra düzeltirim.",
      status: "pending",
      isFavourite: false),
  ProductModel(
      image:
          "https://play-lh.googleusercontent.com/3vS4HgaeuFnDnuxq9UWgLF5h8e0nxTfuySDfk1JzI0t13FoJteTDwz1ujzwHb8amEPZo",
      id: "4",
      name: "Watermelon",
      price: "4",
      description:
          "Olum karpuzun ingilizcesi Watermelon mu la? ne alaka aq sulu meyve sensin o",
      status: "pending",
      isFavourite: false),
];
