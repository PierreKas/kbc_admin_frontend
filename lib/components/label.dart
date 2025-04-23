import 'package:flutter/material.dart';
import 'package:kbc_admin/colors/colors.dart';

class MyTextFieldLabel extends StatelessWidget {
  final String labelContent; // Marked as final
  const MyTextFieldLabel({super.key, required this.labelContent});

  @override
  Widget build(BuildContext context) {
    return Text(
      labelContent,
      textAlign: TextAlign.start,
      style: TextStyle(
          color: MyColors.black.withOpacity(0.7),
          fontWeight: FontWeight.bold,
          fontSize: 14),
    );
  }
}
