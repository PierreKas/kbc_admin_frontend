import 'package:flutter/material.dart';
import 'package:kbc_admin/colors/colors.dart';

class MyButtons extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final double? width;
  final double? height;
  final IconData? icon;
  const MyButtons({
    super.key,
    required this.onPressed,
    required this.text,
    this.height,
    this.width,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [MyColors.amber, MyColors.amber.withOpacity(0.7)],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.3),
            blurRadius: 8,
            //offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: MyColors.black,
            ),
            Text(
              text,
              style: const TextStyle(
                color: MyColors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
