import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.red,
  inputDecorationTheme: InputDecorationTheme(
    border: outlineInputBorder,
    errorBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      textStyle: TextStyle(
        fontSize: 18,
      ),
      disabledBackgroundColor: Colors.grey,
    )
  )
); 


OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    );