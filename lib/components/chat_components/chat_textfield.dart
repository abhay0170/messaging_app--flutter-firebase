import 'package:flutter/material.dart';

class ChatTextfield extends StatelessWidget {
  final String hindText;
  final Icon? icon;
  final TextEditingController controller;

  const ChatTextfield({
    super.key,
    required this.hindText,
    required this.controller,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
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
