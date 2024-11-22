// 保存時の自動整形でfoundationが消えないように警告を消している
// ignore: unused_import, directives_ordering
import 'package:ebbinghaus_forgetting_curve/presentation/theme/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_theme_state.freezed.dart';

@freezed
class CustomThemeState with _$CustomThemeState {
  const CustomThemeState._();
  const factory CustomThemeState({
    @Default('') String currentTheme,
    @Default({}) Map<String, ThemeData> themes,
    required double fontSize,
    required String thickness,
    required int textHeight,
    required String textFamily,
    required String language,
  }) = _CustomThemeState;

  ThemeData currentAppTheme() {
    final themeData = themes[currentTheme]!;
    final updatedThemeData = themeData.copyWith(
      textTheme: themeData.textTheme.copyWith(
        labelSmall: themeData.textTheme.labelSmall?.copyWith(
          fontSize: fontSize,
          fontWeight: thickness == 'thin' ? FontWeight.normal : FontWeight.bold,
          fontFamily: textFamily,
        ),
        titleLarge: themeData.textTheme.titleLarge?.copyWith(
          fontFamily: textFamily,
        ),
        titleSmall: themeData.textTheme.titleSmall?.copyWith(
          fontFamily: textFamily,
        ),
        titleMedium: themeData.textTheme.titleMedium?.copyWith(
          fontFamily: textFamily,
        ),
        bodyMedium: themeData.textTheme.bodyMedium?.copyWith(
          fontFamily: textFamily,
        ),
        bodySmall: themeData.textTheme.bodySmall?.copyWith(
          fontFamily: textFamily,
        ),
        labelLarge: themeData.textTheme.bodyMedium?.copyWith(
          fontFamily: textFamily,
        ),
      ),
    );

    return updatedThemeData;
  }
}
