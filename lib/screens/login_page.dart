import 'package:flutter/material.dart';
import 'package:messaging_app/services/auth/auth_services.dart';
import 'package:messaging_app/components/my_button.dart';
import 'package:messaging_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  // email and password controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  // Login method
  void login(BuildContext context) async {
    AuthServices authServices = AuthServices();

    try {
      await authServices.signInWithEmailAndPassword(
        _emailController.text,
        _pwController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),

          SizedBox(height: 50),

          // Welcome Back message
          Text(
            "Welcome Back, You have been missed!",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),

          SizedBox(height: 25),

          // email textfield
          MyTextfield(
            hindText: "Email",
            obscureText: false,
            controller: _emailController,
          ),

          SizedBox(height: 10),

          // password textfield
          MyTextfield(
            hindText: "Password",
            obscureText: true,
            controller: _pwController,
          ),

          SizedBox(height: 25),

          // login button
          MyButton(text: "Login", onTap: () => login(context)),

          SizedBox(height: 25),

          // register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "not a member ?",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "register now",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
