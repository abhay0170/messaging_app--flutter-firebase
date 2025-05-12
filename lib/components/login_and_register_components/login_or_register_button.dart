import 'package:flutter/material.dart';

class LoginOrRegisterButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const LoginOrRegisterButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          border: Border.all(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Center(child: Text(text)),
      ),
    );
  }
}
