import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_shop/constants/constant.dart';
import 'package:flutter_e_shop/constants/routes.dart';
import 'package:flutter_e_shop/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:flutter_e_shop/screens/auth_ui/sign_up/Sign_up.dart';
import 'package:flutter_e_shop/screens/home/home.dart';
import 'package:flutter_e_shop/widgets/primary_button/primary_button.dart';
import 'package:flutter_e_shop/widgets/top_titles/top_titles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isShowPassword = true;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                controller: email,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: password,
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
                    child:isShowPassword ? Icon(Icons.visibility,color: Colors.grey,) :  Icon(
                      Icons.visibility_off,
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
                onPressed: () async {
                  bool isValidate = loginValidation(email.text, password.text);
                  if (isValidate) {
                    bool isLogined = await FirebaseAuthHelper.instance
                        .login(email.text, password.text, context);
                        if(isLogined){
                          Routes.instance.pushAndRemoveUntil(widget: Home(), context: context);
                        }
                  }
                },
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
      ),
    );
  }
}
