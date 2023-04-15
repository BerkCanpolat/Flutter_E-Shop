import 'package:flutter/material.dart';
import 'package:flutter_e_shop/constants/theme.dart';
import 'package:flutter_e_shop/screens/auth_ui/welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube E-Commerce',
      theme: themeData,
      home: Welcome(),
    );
  }
}