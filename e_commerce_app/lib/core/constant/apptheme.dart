import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "Cairo",
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorApp.primaryColor),
  appBarTheme: const AppBarTheme(
    color: ColorApp.grey,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: ColorApp.primaryColor),
    titleTextStyle: TextStyle(
      color: ColorApp.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 25,
      fontFamily: "Cairo",
    ),
  ),
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: ColorApp.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: ColorApp.black),
      bodyLarge: TextStyle(
          height: 2,
          color: ColorApp.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: ColorApp.grey, fontSize: 14)),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: ColorApp.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: ColorApp.black),
      bodyLarge: TextStyle(
          height: 2,
          color: ColorApp.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: ColorApp.grey, fontSize: 14)),
  primarySwatch: Colors.blue,
);
