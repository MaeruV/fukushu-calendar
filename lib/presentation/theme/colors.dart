import 'package:flutter/material.dart';

class BrandColor {
  static const white = Colors.white;
  static const black = Colors.black;
  static const grey = Color(0xFF7A7A7A);
  static const moreGrey = Color(0xFF8E8E93);
  static const deleteRed = Color(0xFFFF3B30);
  static const blue = Color(0xFF45539D);
  static final blackTranslucent = Colors.black.withOpacity(0.5);
  static const background = Color(0xFFF0F0F0);
}

class TaskColorPalette {
  static const Map<String, Color> rightPalette = {
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

  static const Map<String, Color> deepPalette = {
    'yellow': Color(0xFFF9A825),
    'green': Color(0xFF2E7D32),
    'beige': Color(0xFF8B6B61),
    'red': Color(0xFFC62828),
    'grey': Color(0xFF757575),
    'cream': Color(0xFFFFCC80),
    'skyBlue': Color(0xFF0288D1),
    'mintGreen': Color(0xFF00BFA5),
    'lemon': Color(0xFFFDD835),
  };
}
