import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_e_shop/constants/routes.dart';
import 'package:flutter_e_shop/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:flutter_e_shop/provider/app_provider.dart';
import 'package:flutter_e_shop/screens/change_password/change_password.dart';
import 'package:flutter_e_shop/screens/edit_profile/edit_profile.dart';
import 'package:flutter_e_shop/screens/favourite_screen/favourite_screen.dart';
import 'package:flutter_e_shop/widgets/primary_button/primary_button.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Account",
          style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                appProvider.getUserInformation.image == null ? Icon(
                  Icons.person_outline,size: 120,
                  ) : CircleAvatar(
                    backgroundImage: NetworkImage(appProvider.getUserInformation.image!),
                    radius: 50,
                  ),
                Text(
                  appProvider.getUserInformation.name!,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                Text(appProvider.getUserInformation.email!),
                SizedBox(height: 12,),
                PrimaryButton(
                  title: "Edit Profile",
                  onPressed: (){
                    Routes.instance.push(widget: EditProfile(), context: context);
                  },
                  ),
              ],
            ),
            ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      
                    },
                    leading: Icon(Icons.shopping_bag_outlined),
                    title: Text("Your Orders"),
                  ),
                  ListTile(
                    onTap: () {
                      Routes.instance.push(widget: FavouriteScreen(), context: context);
                    },
                    leading: Icon(Icons.favorite_outline),
                    title: Text("Favourite"),
                  ),
                  ListTile(
                    onTap: () {
                      
                    },
                    leading: Icon(Icons.info_outline),
                    title: Text("About Us"),
                  ),
                  ListTile(
                    onTap: () {
                      
                    },
                    leading: Icon(Icons.support_outlined),
                    title: Text("Support"),
                  ),
                  ListTile(
                    onTap: () {
                      Routes.instance.push(widget: ChangePassword(), context: context);
                    },
                    leading: Icon(Icons.change_circle_outlined),
                    title: Text("Change Password"),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                      FirebaseAuthHelper.instance.signOut();
                      });
                    },
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Log out"),
                  ),
                  SizedBox(height: 12,),
                  Text("Version 1.0.0"),
                ],
              ),
            ),
            ),
        ],
      ),
    );
  }
}