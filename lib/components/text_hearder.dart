import 'package:flutter/material.dart';
import 'package:kbc_admin/colors/colors.dart';

class MyTextHeader extends StatelessWidget {
  final String content;
  const MyTextHeader({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      content,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: MyColors.white), //Color.fromARGB(255, 73, 71, 71)
    );
  }
}
