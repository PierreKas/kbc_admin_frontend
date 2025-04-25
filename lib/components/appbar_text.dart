import 'package:flutter/material.dart';
import 'package:kbc_admin/colors/colors.dart';

class MyAppBarText extends StatelessWidget {
  final String content;
  const MyAppBarText({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(content,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: MyColors.black,
        ));
  }
}
