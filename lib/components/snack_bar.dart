import 'package:flutter/material.dart';
import 'package:kbc_admin/colors/colors.dart';

class MySnackBar {
  // static void showSuccessMessage(String message, BuildContext context) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       width: 200,
  //       content: Text(
  //         message,
  //         style: const TextStyle(color: MyColors.black),
  //       ),
  //       backgroundColor: MyColors.amber,
  //       behavior: SnackBarBehavior.floating,
  //       duration: const Duration(seconds: 6),
  //     ),
  //   );
  // }

  // static void showErrorMessage(String message, BuildContext context) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       width: 200,
  //       content: Text(message),
  //       backgroundColor: Colors.red,
  //       behavior: SnackBarBehavior.floating,
  //       duration: const Duration(seconds: 6),
  //     ),
  //   );
  // }

  static void showSuccessMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.greenAccent),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: MyColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: MyColors.amber.withOpacity(0.95),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        duration: const Duration(seconds: 4),
        elevation: 8,
      ),
    );
  }

  static void showErrorMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        duration: const Duration(seconds: 4),
        elevation: 8,
      ),
    );
  }

  static void checked(Widget checkIcon, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        width: 50,
        content: Icon(
          Icons.check,
          color: MyColors.amber,
        ),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 4),
      ),
    );
  }
}
