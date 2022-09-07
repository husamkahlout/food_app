import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255, 255, 191, 0);
// const kPrimaryColor = Color(0xFFFFC61F);
const kPrimaryLightColor = Color.fromARGB(255, 247, 240, 221);
const double defaultPadding = 16.0;
const ksecondaryColor = Color(0xFFB5BFD0);
const kTextColor = Color(0xFF50505D);
const kTextLightColor = Color(0xFF6A727D);
const darkColor = Color.fromARGB(255, 32, 33, 36);

ThemeData lightTheme = ThemeData(
  fontFamily: "lato",
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: kPrimaryColor,
      shape: const StadiumBorder(),
      maximumSize: const Size(double.infinity, 56),
      minimumSize: const Size(double.infinity, 56),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: kPrimaryLightColor,
    iconColor: kPrimaryColor,
    prefixIconColor: kPrimaryColor,
    contentPadding: EdgeInsets.symmetric(
        horizontal: defaultPadding, vertical: defaultPadding),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide.none,
    ),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: ksecondaryColor),
    bodyText2: TextStyle(color: ksecondaryColor),
  ),
);
ThemeData darkTheme = ThemeData(
  fontFamily: "lato",
  primaryColor: kPrimaryColor,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: darkColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: kPrimaryColor,
      shape: const StadiumBorder(),
      maximumSize: const Size(double.infinity, 56),
      minimumSize: const Size(double.infinity, 56),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: kPrimaryLightColor,
    iconColor: kPrimaryColor,
    prefixIconColor: kPrimaryColor,
    contentPadding: EdgeInsets.symmetric(
        horizontal: defaultPadding, vertical: defaultPadding),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide.none,
    ),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: ksecondaryColor),
    bodyText2: TextStyle(color: ksecondaryColor),
  ),
);
