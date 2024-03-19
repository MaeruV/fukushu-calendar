import 'package:flutter/material.dart';

class BrandColor {
  static const white = Colors.white;
  static const black = Colors.black;
  static const grey = Color(0xFF7A7A7A);
  static const moreGrey = Color(0xFF8E8E93);
  static const darkGrey = Color.fromARGB(255, 125, 124, 124);
  static const deleteRed = Color(0xFFFF3B30);
  static const blue = Color(0xFF45539D);
  static final blackTranslucent = Colors.black.withOpacity(0.5);
  static const background = Color(0xFFF0F0F0);
}

class TaskColorPalette {
  static const Map<String, Color> lightPalette = {
    'yellow': Color(0xFFFFF9C4),
    'green': Color(0xFFC8E6C9),
    'beige': Color(0xFFD7CCC8),
    'red': Color(0xFFFFCDD2),
    'grey': Color(0xFFE0E0E0),
    'cream': Color(0xFFFFECB3),
    'skyBlue': Color(0xFFB3E5FC),
    'mintGreen': Color(0xFFB2DFDB),
    'lemon': Color(0xFFFFF9C4),
  };

  static const Map<String, Color> normalPalette = {
    'yellow': Color(0xFFFFEB3B),
    'green': Color(0xFF4CAF50),
    'beige': Color(0xFFBCAAA4),
    'red': Color(0xFFF44336),
    'grey': Color(0xFFBDBDBD),
    'cream': Color(0xFFFFC107),
    'skyBlue': Color(0xFF03A9F4),
    'mintGreen': Color(0xFF26A69A),
    'lemon': Color(0xFFFFEB3B),
  };
}
