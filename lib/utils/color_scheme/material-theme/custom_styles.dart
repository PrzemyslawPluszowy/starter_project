import 'package:flutter/material.dart';

class CustomStyles {
  static const boxShadowForm = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 10,
      offset: Offset(0, 0),
    )
  ];

  static const gradientForm = LinearGradient(
    transform: GradientRotation(3.6),
    colors: [
      Color.fromARGB(255, 228, 226, 226),
      Color.fromARGB(255, 249, 249, 249),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
