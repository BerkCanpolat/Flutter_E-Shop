import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_shop/constants/routes.dart';
import 'package:flutter_e_shop/screens/auth_ui/sign_up/Sign_up.dart';
import 'package:flutter_e_shop/widgets/primary_button/primary_button.dart';
import 'package:flutter_e_shop/widgets/top_titles/top_titles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopTitles(
                subtitle: "Welcome Back To E Commerce App", title: "Login"),
            SizedBox(
              height: 46,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'E-mail',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              obscureText: isShowPassword,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.password_sharp),
                suffixIcon: CupertinoButton(
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            PrimaryButton(
              title: 'Login',
              onPressed: () {},
            ),
            SizedBox(
              height: 12,
            ),
            Center(child: Text("Don't Have an account?")),
            SizedBox(
              height: 12,
            ),
            Center(
                child: CupertinoButton(
                    onPressed: () {
                      Routes.instance.push(widget: SignUp(), context: context);
                    },
                     child: Text(
                      "Create an account",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      ),
                     ),
                     ),
          ],
        ),
      ),
    );
  }
}