import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

/// フォント
class BrandFont {
  static const general = 'NotoSansJP';
}

/// 文字スタイル
class BrandText {
  static const titleL = TextStyle(
    fontFamily: "Inter",
    fontWeight: FontWeight.bold,
    fontSize: 36,
  );

  static const titleLM = TextStyle(
    fontFamily: "Inter",
    fontWeight: FontWeight.bold,
    fontSize: 28,
  );

  static const titleM = TextStyle(
    color: BrandColor.black,
    fontFamily: "Inter",
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );

  static const titleSM = TextStyle(
    color: BrandColor.black,
    fontFamily: "Inter",
    fontWeight: FontWeight.bold,
    fontSize: 19,
  );

  static const titleS = TextStyle(
    color: BrandColor.black,
    fontFamily: "Inter",
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static const bodyL = TextStyle(
    color: BrandColor.black,
    fontFamily: "Inter",
    fontWeight: FontWeight.normal,
    fontSize: 20,
  );

  static const bodyLM = TextStyle(
    color: BrandColor.black,
    fontFamily: "Inter",
    fontWeight: FontWeight.normal,
    fontSize: 18,
  );

  static const bodyM = TextStyle(
    color: BrandColor.black,
    fontFamily: "Inter",
    fontWeight: FontWeight.w300,
    fontSize: 16,
  );

  static const bodyS = TextStyle(
    fontFamily: "Inter",
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const bodySS = TextStyle(
    color: BrandColor.black,
    fontFamily: "Inter",
    fontWeight: FontWeight.normal,
    fontSize: 11,
  );
}
