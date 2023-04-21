import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_shop/constants/routes.dart';
import 'package:flutter_e_shop/screens/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:flutter_e_shop/screens/home/home.dart';
import 'package:flutter_e_shop/widgets/primary_button/primary_button.dart';
import 'package:flutter_e_shop/widgets/top_titles/top_titles.dart';

import '../../../constants/constant.dart';
import '../../../firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isShowPassword = true;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopTitles(subtitle: "Welcome yo Storia", title: "Create Account"),
              SizedBox(
                height: 46,
              ),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.person_2_outlined),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Phone',
                  prefixIcon: Icon(Icons.phone),
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
                title: 'Create an account',
                onPressed: () async{
                  bool isValidate = signUpValidation(email.text, password.text,name.text,phone.text);
                  if (isValidate) {
                    bool isLogined = await FirebaseAuthHelper.instance
                        .signUp(name.text,email.text, password.text, context);
                        if(isLogined){
                          Routes.instance.pushAndRemoveUntil(widget: CustomBottomBar(), context: context);
                        }
                  }
                },
              ),
              SizedBox(
                height: 12,
              ),
              Center(child: Text("I Have already an account?")),
              SizedBox(
                height: 12,
              ),
              Center(
                child: CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Login",
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
