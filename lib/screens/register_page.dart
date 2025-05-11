import 'package:flutter/material.dart';
import 'package:messaging_app/services/auth/auth_services.dart';
import 'package:messaging_app/components/my_button.dart';
import 'package:messaging_app/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  // email and password controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  // register method
  void register(BuildContext context) async {
    final _auth = AuthServices();

    if (_pwController.text == _confirmPwController.text) {
      try {
        _auth.signUpWithEmailAndPassword(
          _emailController.text,
          _pwController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text("Password dont match")),
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
            "Lets, Create an Account for you..",
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

          SizedBox(height: 10),

          // confirm password textfield
          MyTextfield(
            hindText: "Confirm Password",
            obscureText: true,
            controller: _confirmPwController,
          ),

          SizedBox(height: 25),

          // login button
          MyButton(text: "Register", onTap: () => register(context)),

          SizedBox(height: 25),

          // register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Login now",
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
