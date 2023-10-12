import 'package:clockie/config/routes.dart';
import 'package:clockie/config/utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clockie',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
    );
  }
}
