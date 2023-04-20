import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_shop/constants/theme.dart';
import 'package:flutter_e_shop/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:flutter_e_shop/firebase_options.dart';
import 'package:flutter_e_shop/provider/app_provider.dart';
import 'package:flutter_e_shop/screens/auth_ui/welcome/welcome.dart';
import 'package:flutter_e_shop/screens/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:flutter_e_shop/screens/home/home.dart';
import 'package:provider/provider.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Youtube E-Commerce',
        theme: themeData,
        home: StreamBuilder(
          stream: FirebaseAuthHelper.instance.getAuthChange,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return CustomBottomBar();
            }
            return Welcome();
          },
        )
      ),
    );
  }
}