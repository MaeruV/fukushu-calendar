import 'package:flutter/material.dart';

class BrandColor {
  static const white = Colors.white;
  static const black = Colors.black;
  static const grey = Color(0xFF7A7A7A);
  static const moreGrey = Color(0xFF8E8E93);
  static const darkGrey = Color.fromARGB(255, 125, 124, 124);
  static const deleteRed = Color(0xFFFF3B30);
  static const deepBlue = Color(0xFF45539D);
  static const blue = Color(0xFF1E88E5);
  static final blackTranslucent = Colors.black.withOpacity(0.5);
  static const background = Color(0xFFF0F0F0);
  static const canvas = Color(0xFF0A0E21);
  static const ivoryBlack = Color(0xFF333132);
  static const deepBlackBlue = Color(0xFF1A1A2E); // 深い黒に少し青を加えた色
  static const flatBlackBlue = Color(0xFF2B2B3F); // 面で使いたい時の少し青が入った黒
  static const standardBlackBlue = Color(0xFF33334D); // 標準的な黒に青を加えた色。文字色にも適している
  static const softBlackBlue = Color(0xFF4D4D66); // 全体が柔らかめの時に使う、青が入った黒
  static const versatileBlackBlue = Color(0xFF666680); // 他の色と合わせやすい、少し青が入った黒
}

class TaskColorPalette {
  static const List<int> normalPalette = [
    0xFF388E3C, // green
    0xFFD32F2F, // red
    0xFFFFA000, // cream
    0xFF0288D1, // skyBlue
    0xFF00796B, // mintGreen
    0xFFFDD835, // lemon
  ];
}
