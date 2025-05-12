import 'package:flutter/material.dart';
import 'package:messaging_app/components/login_and_register_components/login_options.dart';
import 'package:messaging_app/components/logo.dart';
import 'package:messaging_app/screens/under_maintanence.dart';
import 'package:messaging_app/services/auth/auth_services.dart';
import 'package:messaging_app/components/login_and_register_components/login_or_register_button.dart';
import 'package:messaging_app/components/login_and_register_components/login_register_textfield.dart';

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
      final snackBar = SnackBar(
        content: Text(e.toString()),
        duration: Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
          Logo(imageName: "assets/logo/logo.png"),

          SizedBox(height: 30),

          // Welcome Back message
          Text(
            "Welcome Back, You have been missed!",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 15,
            ),
          ),

          SizedBox(height: 20),

          // email textfield
          LoginRegisterTextfield(
            icon: Icon(Icons.mail_outline),
            hindText: "Email",
            obscureText: false,
            controller: _emailController,
          ),

          SizedBox(height: 10),

          // password textfield
          LoginRegisterTextfield(
            icon: Icon(Icons.fingerprint),
            hindText: "Password",
            obscureText: true,
            controller: _pwController,
          ),

          SizedBox(height: 20),

          // login button
          LoginOrRegisterButton(text: "Login", onTap: () => login(context)),

          SizedBox(height: 20),

          // register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "not a member ?  ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "REGISTER NOW",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: Divider(indent: 15)),
              Text(" OR "),
              Expanded(child: Divider(endIndent: 15)),
            ],
          ),
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LoginOptions(
                iconName: "assets/icons/twitter.png",
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UnderMaintenance(),
                      ),
                    ),
              ),
              LoginOptions(
                iconName: "assets/icons/google.png",
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UnderMaintenance(),
                      ),
                    ),
              ),
              LoginOptions(
                iconName: "assets/icons/apple-logo.png",
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UnderMaintenance(),
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
