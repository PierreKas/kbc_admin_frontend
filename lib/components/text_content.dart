import 'package:flutter/material.dart';
import 'package:kbc_admin/colors/colors.dart';

class MyTextContent extends StatelessWidget {
  final String content;
  const MyTextContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(content,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
          color: MyColors.black,
          fontWeight: FontWeight.w300,
        ));
  }
}
