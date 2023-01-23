import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(textTheme: textTheme(), useMaterial3: true);
}

const primaryColor = Color.fromARGB(203, 37, 123, 53);
const bgColor = Colors.transparent;
const bodyTextColor = Colors.white;
const defaultSizedBox = SizedBox(
  height: 10.00,
);
const textStyleDefault = TextStyle(color: Colors.white);

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 32,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold,
    ),
    headline5: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold,
    ),
  );
}
