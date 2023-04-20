import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.red,
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      foregroundColor: Colors.red,
      side: BorderSide(
        color: Colors.red,
        width: 2,
      ),
      textStyle: TextStyle(
        color: Colors.red,
      )
    )),
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
    ),
    primarySwatch: Colors.red,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      toolbarTextStyle: TextStyle(color: Colors.black)
    )
    );

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey,
  ),
);
