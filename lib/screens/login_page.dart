import 'package:flutter/material.dart';
import 'package:messaging_app/components/login_options.dart';
import 'package:messaging_app/components/logo.dart';
import 'package:messaging_app/screens/under_maintanence.dart';
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

          SizedBox(height: 50),

          // Welcome Back message
          Text(
            "Welcome Back, You have been missed!",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 17,
            ),
          ),

          SizedBox(height: 25),

          // email textfield
          MyTextfield(
            icon: Icon(Icons.mail_outline),
            hindText: "Email",
            obscureText: false,
            controller: _emailController,
          ),

          SizedBox(height: 10),

          // password textfield
          MyTextfield(
            icon: Icon(Icons.fingerprint),
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
                "not a member ?  ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "REGISTER NOW",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(child: Divider()),
              Text(" OR "),
              Expanded(child: Divider()),
            ],
          ),
          SizedBox(height: 15),

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
