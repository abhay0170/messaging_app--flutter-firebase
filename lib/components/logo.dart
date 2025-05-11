import 'dart:ui';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String imageName;
  const Logo({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Shadow layer
        Positioned(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
                BlendMode.srcATop,
              ),
              child: Image.asset(imageName, height: 90),
            ),
          ),
        ),
        // Actual image
        Image.asset(imageName, height: 90),
      ],
    );
  }
}
