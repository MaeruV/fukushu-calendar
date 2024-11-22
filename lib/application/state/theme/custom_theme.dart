import 'package:ebbinghaus_forgetting_curve/application/types/theme/custom_theme_state.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/others/others_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/others.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'custom_theme.g.dart';

@riverpod
Future<String> themeInit(ThemeInitRef ref) async {
  return ref.read(customThemeProvider.notifier).initialize();
}

@riverpod
class CustomTheme extends _$CustomTheme {
  late OthersUsecase others;

  @override
  CustomThemeState build() {
    others = ref.watch(othersUsecaseProvider);

    return CustomThemeState(
      themes: Map.of(
        {'light': AppTheme.lightTheme, 'dark': AppTheme.darkTheme},
      ),
      fontSize: 13,
      thickness: 'thin',
      textHeight: 20,
      textFamily: 'Inter',
      language: 'ja',
    );
  }

  ThemeData get currentTheme =>
      state.themes[state.currentTheme] ?? ThemeData.light();

  Size calculationTextSize({required double fontSize}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: '英単語1-300', style: TextStyle(fontSize: fontSize)),
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
    )..layout(
        minWidth: 0,
      );
    return textPainter.size;
  }

  Future<void> apply(String theme) async {
    await others.saveOthers(
      currentTheme: theme,
      fontSize: state.fontSize,
      thickness: state.thickness,
      textFamily: state.textFamily,
      language: state.language,
    );
    state = state.copyWith(currentTheme: theme);
  }

  // 共通のテーマ更新ロジックを抽出
  Future<void> updateTheme({
    required double? fontSize,
    required String? thickness,
    required String? textFamily,
    required String? language,
  }) async {
    final nonNullFontSize = fontSize ?? state.fontSize;
    final nonNullThickness = thickness ?? state.thickness;
    final nonNullTextFamily = textFamily ?? state.textFamily;
    final nonNulllanguage = language ?? state.language;

    final fontWeight =
        nonNullThickness == 'bold' ? FontWeight.bold : FontWeight.normal;

    final updatedThemeData = currentTheme.copyWith(
      textTheme: currentTheme.textTheme.copyWith(
        labelSmall: currentTheme.textTheme.labelSmall?.copyWith(
          fontSize: nonNullFontSize,
          fontWeight: fontWeight,
          fontFamily: nonNullTextFamily,
        ),
      ),
    );

    final updatedThemes = {
      ...state.themes,
      state.currentTheme: updatedThemeData,
    };

    final other = await others.fetchAll();

    if (other != null) {
      await others.updateOthers(
        others: other,
        currentTheme: other.currentTheme,
        fontSize: nonNullFontSize,
        thickness: nonNullThickness,
        textFamily: nonNullTextFamily,
        language: nonNulllanguage,
      );
    } else {
      await others.saveOthers(
        currentTheme: state.currentTheme,
        fontSize: nonNullFontSize,
        thickness: nonNullThickness,
        textFamily: nonNullTextFamily,
        language: nonNulllanguage,
      );
    }

    final textSize = calculationTextSize(fontSize: nonNullFontSize);

    state = state.copyWith(
      themes: updatedThemes,
      fontSize: nonNullFontSize,
      thickness: nonNullThickness,
      textHeight: textSize.height.toInt(),
      textFamily: nonNullTextFamily,
      language: nonNulllanguage,
    );
  }

  Future<String> initialize() async {
    final theme = await _fetchTheme();
    if (theme != null) {
      final textSize = calculationTextSize(fontSize: theme.fontSize);
      state = state.copyWith(
        currentTheme: theme.currentTheme,
        fontSize: theme.fontSize,
        thickness: theme.thickness,
        textHeight: textSize.height.toInt(),
        textFamily: theme.textFamily,
        language: theme.language,
      );
      return theme.language;
    } else {
      final textSize = calculationTextSize(fontSize: state.fontSize);
      state = state.copyWith(
        currentTheme: 'light',
        fontSize: state.fontSize,
        thickness: state.thickness,
        textHeight: textSize.height.toInt(),
        textFamily: state.textFamily,
        language: state.language,
      );
      return 'ja';
    }
  }

  Future<Others?> _fetchTheme() async {
    return await others.fetchAll();
  }
}
