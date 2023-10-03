import 'package:flutter/material.dart';

Color appColorOne = const Color(0xff49DFC4);
Color appColorTwo = const Color(0xff26B69C);

CircularProgressIndicator appProgressIndicator = CircularProgressIndicator(
  color: appColorOne,
);

ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    fontFamily: "Laila");
