import 'package:flutter/material.dart';
import 'package:kbc_admin/pages/home_page.dart';
import 'package:kbc_admin/services/aut_token.dart';

void main() async {
  // final token = AuthToken.getToken();
  // final role = AuthToken.getUserRole();

  // if (token != null && role != null) {
  //   UsersController.userRole = role; // Set the role from localStorage
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final token = AuthToken.getToken();
    //  final initialPage = token != null ? const HomePage() : const LoginPage();

    return MaterialApp(
      theme: ThemeData(textSelectionTheme: const TextSelectionThemeData()),
      home: const HomePage(), //const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
