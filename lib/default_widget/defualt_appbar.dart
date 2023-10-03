import 'package:clockie/config/utils.dart';
import 'package:flutter/material.dart';

class DefualtAppbar extends StatelessWidget {
  const DefualtAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Clockie",
        style: TextStyle(color: appColorOne, fontSize: 32),
      ),
    );
  }
}
