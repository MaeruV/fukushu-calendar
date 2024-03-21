import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'colors.dart'; // カスタムカラーの定義が含まれる

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    canvasColor: BrandColor.background,
    primaryColor: BrandColor.ivoryBlack, // 薄めの黒色
    primaryColorDark: BrandColor.white,
    primaryColorLight: BrandColor.black,
    dividerColor: BrandColor.grey,
    scaffoldBackgroundColor: BrandColor.background,
    fontFamily: BrandFont.general,
    textTheme: commonTextTheme,
    iconTheme: commonIconTheme,
    buttonTheme: commonButtonTheme,
    dividerTheme: commonDivider,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    canvasColor: const Color(0xFF0A0E21), // 深いグレーの背景色
    primaryColor: BrandColor.background, // 明るい青色
    primaryColorDark: BrandColor.black,
    primaryColorLight: BrandColor.white,
    dividerColor: const Color(0xFFBDBDBD), // 分割線などに使用する中間のグレー
    scaffoldBackgroundColor: const Color(0xFF0A0E21), // Scaffoldの背景色としての暗いグレー
    fontFamily: BrandFont.general,
    textTheme: commonTextTheme,
    iconTheme: commonIconTheme,
    buttonTheme: commonButtonTheme,
    dividerTheme: commonDivider,
  );

  static const commonTextTheme = TextTheme(
    labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
    labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
    labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
    bodyLarge:
        TextStyle(fontSize: 22, fontWeight: FontWeight.normal), // 通常のテキスト色
    bodyMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
    bodySmall:
        TextStyle(fontSize: 15, fontWeight: FontWeight.normal), // サブテキストなどに使用
    titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  );

  static const commonIconTheme = IconThemeData(
    color: Color(0xFF82B1FF), // アイコンに使用する青色のシェード
  );

  static const commonButtonTheme = ButtonThemeData(
    buttonColor: Color(0xFF1E88E5), // ボタンの背景色としての青色
    textTheme: ButtonTextTheme.primary,
  );

  static const commonDivider = DividerThemeData(
    color: Colors.grey,
  );
}
