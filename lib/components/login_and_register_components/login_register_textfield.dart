import 'package:flutter/material.dart';

class LoginRegisterTextfield extends StatelessWidget {
  final String hindText;
  final bool obscureText;
  final Icon? icon;
  final TextEditingController controller;

  const LoginRegisterTextfield({
    super.key,
    required this.hindText,
    required this.obscureText,
    required this.controller,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(
                context,
              ).colorScheme.inversePrimary.withValues(alpha: 0.7),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText: hindText,
          prefixIcon: icon,
          hintStyle: TextStyle(
            color: Theme.of(
              context,
            ).colorScheme.inversePrimary.withValues(alpha: .8),
          ),
        ),
      ),
    );
  }
}
