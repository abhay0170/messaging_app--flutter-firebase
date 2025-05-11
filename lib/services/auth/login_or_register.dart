import 'package:flutter/material.dart';
import 'package:messaging_app/screens/login_page.dart';
import 'package:messaging_app/screens/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initial show the login page

  bool showLoginPage = true;

  // toggle between the login and register page

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    }
    return RegisterPage(onTap: togglePages);
  }
}
