import 'package:flutter/material.dart';

class LoginOptions extends StatelessWidget {
  final String iconName;
  final void Function()? onTap;

  const LoginOptions({super.key, required this.iconName, this.onTap});

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
          borderRadius: BorderRadius.circular(15),
        ),
        height: 50,
        padding: EdgeInsets.all(8),
        child: Image(image: AssetImage(iconName)),
      ),
    );
  }
}
