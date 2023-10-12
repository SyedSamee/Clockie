import 'dart:async';

import 'package:clockie/config/extentions/string_extention.dart';
import 'package:clockie/view/stopwatch/bloc/stop_bloc.dart';
import 'package:flutter/material.dart';

Color appColorOne = const Color(0xff49DFC4);
Color appColorTwo = const Color(0xff26B69C);
int mainValueHours = 0;
int mainValueMins = 0;
int mainValueSecs = 0;

Timer? stopWatchTimer;

CircularProgressIndicator appProgressIndicator = CircularProgressIndicator(
  color: appColorOne,
);

ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    fontFamily: "Laila");
