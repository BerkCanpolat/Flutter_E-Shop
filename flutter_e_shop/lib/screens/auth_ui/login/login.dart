import 'package:flutter/material.dart';
import 'package:flutter_e_shop/widgets/top_titles/top_titles.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TopTitles(subtitle: "Welcome Back To E Commerce App", title: "Login"),
        ],
      ),
    );
  }
}