import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_e_shop/constants/constant.dart';
import 'package:flutter_e_shop/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:flutter_e_shop/models/user_model/user_model.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';
import '../../widgets/primary_button/primary_button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isShowPassword = true;
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Change Password",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          TextFormField(
            controller: newPassword,
            obscureText: isShowPassword,
            decoration: InputDecoration(
              hintText: 'New Password',
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
          SizedBox(height: 12,),
          TextFormField(
            controller: confirmPassword,
            obscureText: isShowPassword,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              prefixIcon: Icon(Icons.password_sharp),
            ),
          ),
          SizedBox(height: 36,),
          PrimaryButton(
            title: "Update",
            onPressed: () async {
              if(newPassword.text.isEmpty){
                showMessage("New Password is empty");
              }else if(confirmPassword.text.isEmpty){
                showMessage("Confirm Password is empty");
              }else if(confirmPassword.text == newPassword.text){
                  FirebaseAuthHelper.instance.chancePassword(newPassword.text, context);
                }else{
                  showMessage("Confirm Password is not match");
                }
            },
          )
        ],
      ),
    );
  }
}
