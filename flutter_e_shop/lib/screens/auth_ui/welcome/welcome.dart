import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_shop/constants/asset_images.dart';
import 'package:flutter_e_shop/constants/routes.dart';
import 'package:flutter_e_shop/screens/auth_ui/login/login.dart';
import 'package:flutter_e_shop/widgets/primary_button/primary_button.dart';
import 'package:flutter_e_shop/widgets/top_titles/top_titles.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopTitles(subtitle: "Buy AnyItems From Using App", title: "Welcome"),
            Center(
              child: Image.asset(AssetsImages.instance.welcomeImage),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Image.asset(
                    AssetsImages.instance.googleLogo,
                    scale: 30.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            PrimaryButton(title: "Login", onPressed: () {
              Routes.instance.push(widget:Login(),context: context);
            }),
            SizedBox(
              height: 18,
            ),
            PrimaryButton(title: "Sign Up", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
