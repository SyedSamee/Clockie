import 'package:clockie/view/bottom_viewer/bottom_viewer.dart';
import 'package:clockie/view/home/home.dart';
import 'package:clockie/view/stopwatch/stopwatch.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> appRoutes = {
  "/": (context) => const BottomViewer(),
};
