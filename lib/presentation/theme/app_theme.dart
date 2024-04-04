import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart'; // カスタムカラーの定義が含まれる

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    canvasColor: BrandColor.background,
    colorScheme: const ColorScheme.light(
      surface: BrandColor.background,
      primary: BrandColor.background,
      secondary: BrandColor.blue,
      brightness: Brightness.light,
    ),
    highlightColor: BrandColor.white,
    primaryColor: BrandColor.ivoryBlack,
    primaryColorDark: BrandColor.white,
    primaryColorLight: BrandColor.black,
    dividerColor: BrandColor.grey,
    focusColor: BrandColor.deepBlue,
    cardColor: Colors.white,
    scaffoldBackgroundColor: BrandColor.background,
    fontFamily: BrandFont.general,
    textTheme: commonTextTheme,
    iconTheme: commonIconTheme,
    buttonTheme: commonButtonTheme,
    dividerTheme: commonDivider,
    timePickerTheme: constTimePickerLight,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    canvasColor: BrandColor.canvas,
    colorScheme: const ColorScheme.dark(
      surface: BrandColor.canvas,
      primary: BrandColor.background,
      secondary: BrandColor.blue,
      brightness: Brightness.dark,
    ),
    highlightColor: BrandColor.brighterBlue1,
    primaryColor: BrandColor.background,
    primaryColorDark: BrandColor.black,
    primaryColorLight: BrandColor.white,
    cardColor: BrandColor.brighterBlue1,
    focusColor: BrandColor.blue,
    dividerColor: const Color(0xFFBDBDBD),
    scaffoldBackgroundColor: const Color(0xFF0A0E21),
    elevatedButtonTheme: elevatedButtonThemeData,
    fontFamily: BrandFont.general,
    textTheme: commonTextTheme,
    iconTheme: commonIconTheme,
    buttonTheme: commonButtonTheme,
    dividerTheme: commonDivider,
    timePickerTheme: constTimePickerDark,
  );

  static final TimePickerThemeData constTimePickerLight = TimePickerThemeData(
    helpTextStyle: const TextStyle(fontSize: 18.0, color: BrandColor.black),
    hourMinuteColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? Colors.blue.shade300
            : Colors.transparent),
    hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? BrandColor.black
            : BrandColor.black),
    dialHandColor: Colors.blue,
    dayPeriodTextColor: Colors.red,
    dialTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? BrandColor.white
            : BrandColor.black),
    entryModeIconColor: Colors.blue,
  );

  static final TimePickerThemeData constTimePickerDark = TimePickerThemeData(
    helpTextStyle: const TextStyle(fontSize: 18.0, color: BrandColor.white),
    hourMinuteColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? Colors.blue.shade300
            : Colors.transparent),
    hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? BrandColor.background
            : BrandColor.white),
    dialHandColor: Colors.blue,
    dayPeriodTextColor: Colors.red,
    dialTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? BrandColor.black
            : BrandColor.white),
    entryModeIconColor: Colors.blue,
  );

  static const commonTextTheme = TextTheme(
    labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
    labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
    labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
    bodyLarge:
        TextStyle(fontSize: 22, fontWeight: FontWeight.normal), // 通常のテキスト色
    bodyMedium: TextStyle(fontSize: 19, fontWeight: FontWeight.normal),
    bodySmall:
        TextStyle(fontSize: 15, fontWeight: FontWeight.normal), // サブテキストなどに使用
    titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
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

  static final ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0xFF1E88E5)), // ボタンの背景色
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // テキストの色
    ),
  );
}
