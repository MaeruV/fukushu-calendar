// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_theme_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomThemeState {
  String get currentTheme => throw _privateConstructorUsedError;
  Map<String, ThemeData> get themes => throw _privateConstructorUsedError;
  double get fontSize => throw _privateConstructorUsedError;
  String get thickness => throw _privateConstructorUsedError;
  int get textHeight => throw _privateConstructorUsedError;
  String get textFamily => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomThemeStateCopyWith<CustomThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomThemeStateCopyWith<$Res> {
  factory $CustomThemeStateCopyWith(
          CustomThemeState value, $Res Function(CustomThemeState) then) =
      _$CustomThemeStateCopyWithImpl<$Res, CustomThemeState>;
  @useResult
  $Res call(
      {String currentTheme,
      Map<String, ThemeData> themes,
      double fontSize,
      String thickness,
      int textHeight,
      String textFamily,
      String language});
}

/// @nodoc
class _$CustomThemeStateCopyWithImpl<$Res, $Val extends CustomThemeState>
    implements $CustomThemeStateCopyWith<$Res> {
  _$CustomThemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTheme = null,
    Object? themes = null,
    Object? fontSize = null,
    Object? thickness = null,
    Object? textHeight = null,
    Object? textFamily = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      currentTheme: null == currentTheme
          ? _value.currentTheme
          : currentTheme // ignore: cast_nullable_to_non_nullable
              as String,
      themes: null == themes
          ? _value.themes
          : themes // ignore: cast_nullable_to_non_nullable
              as Map<String, ThemeData>,
      fontSize: null == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as double,
      thickness: null == thickness
          ? _value.thickness
          : thickness // ignore: cast_nullable_to_non_nullable
              as String,
      textHeight: null == textHeight
          ? _value.textHeight
          : textHeight // ignore: cast_nullable_to_non_nullable
              as int,
      textFamily: null == textFamily
          ? _value.textFamily
          : textFamily // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomThemeStateImplCopyWith<$Res>
    implements $CustomThemeStateCopyWith<$Res> {
  factory _$$CustomThemeStateImplCopyWith(_$CustomThemeStateImpl value,
          $Res Function(_$CustomThemeStateImpl) then) =
      __$$CustomThemeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String currentTheme,
      Map<String, ThemeData> themes,
      double fontSize,
      String thickness,
      int textHeight,
      String textFamily,
      String language});
}

/// @nodoc
class __$$CustomThemeStateImplCopyWithImpl<$Res>
    extends _$CustomThemeStateCopyWithImpl<$Res, _$CustomThemeStateImpl>
    implements _$$CustomThemeStateImplCopyWith<$Res> {
  __$$CustomThemeStateImplCopyWithImpl(_$CustomThemeStateImpl _value,
      $Res Function(_$CustomThemeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTheme = null,
    Object? themes = null,
    Object? fontSize = null,
    Object? thickness = null,
    Object? textHeight = null,
    Object? textFamily = null,
    Object? language = null,
  }) {
    return _then(_$CustomThemeStateImpl(
      currentTheme: null == currentTheme
          ? _value.currentTheme
          : currentTheme // ignore: cast_nullable_to_non_nullable
              as String,
      themes: null == themes
          ? _value._themes
          : themes // ignore: cast_nullable_to_non_nullable
              as Map<String, ThemeData>,
      fontSize: null == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as double,
      thickness: null == thickness
          ? _value.thickness
          : thickness // ignore: cast_nullable_to_non_nullable
              as String,
      textHeight: null == textHeight
          ? _value.textHeight
          : textHeight // ignore: cast_nullable_to_non_nullable
              as int,
      textFamily: null == textFamily
          ? _value.textFamily
          : textFamily // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomThemeStateImpl extends _CustomThemeState
    with DiagnosticableTreeMixin {
  const _$CustomThemeStateImpl(
      {this.currentTheme = '',
      final Map<String, ThemeData> themes = const {},
      required this.fontSize,
      required this.thickness,
      required this.textHeight,
      required this.textFamily,
      required this.language})
      : _themes = themes,
        super._();

  @override
  @JsonKey()
  final String currentTheme;
  final Map<String, ThemeData> _themes;
  @override
  @JsonKey()
  Map<String, ThemeData> get themes {
    if (_themes is EqualUnmodifiableMapView) return _themes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_themes);
  }

  @override
  final double fontSize;
  @override
  final String thickness;
  @override
  final int textHeight;
  @override
  final String textFamily;
  @override
  final String language;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CustomThemeState(currentTheme: $currentTheme, themes: $themes, fontSize: $fontSize, thickness: $thickness, textHeight: $textHeight, textFamily: $textFamily, language: $language)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CustomThemeState'))
      ..add(DiagnosticsProperty('currentTheme', currentTheme))
      ..add(DiagnosticsProperty('themes', themes))
      ..add(DiagnosticsProperty('fontSize', fontSize))
      ..add(DiagnosticsProperty('thickness', thickness))
      ..add(DiagnosticsProperty('textHeight', textHeight))
      ..add(DiagnosticsProperty('textFamily', textFamily))
      ..add(DiagnosticsProperty('language', language));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomThemeStateImpl &&
            (identical(other.currentTheme, currentTheme) ||
                other.currentTheme == currentTheme) &&
            const DeepCollectionEquality().equals(other._themes, _themes) &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize) &&
            (identical(other.thickness, thickness) ||
                other.thickness == thickness) &&
            (identical(other.textHeight, textHeight) ||
                other.textHeight == textHeight) &&
            (identical(other.textFamily, textFamily) ||
                other.textFamily == textFamily) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentTheme,
      const DeepCollectionEquality().hash(_themes),
      fontSize,
      thickness,
      textHeight,
      textFamily,
      language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomThemeStateImplCopyWith<_$CustomThemeStateImpl> get copyWith =>
      __$$CustomThemeStateImplCopyWithImpl<_$CustomThemeStateImpl>(
          this, _$identity);
}

abstract class _CustomThemeState extends CustomThemeState {
  const factory _CustomThemeState(
      {final String currentTheme,
      final Map<String, ThemeData> themes,
      required final double fontSize,
      required final String thickness,
      required final int textHeight,
      required final String textFamily,
      required final String language}) = _$CustomThemeStateImpl;
  const _CustomThemeState._() : super._();

  @override
  String get currentTheme;
  @override
  Map<String, ThemeData> get themes;
  @override
  double get fontSize;
  @override
  String get thickness;
  @override
  int get textHeight;
  @override
  String get textFamily;
  @override
  String get language;
  @override
  @JsonKey(ignore: true)
  _$$CustomThemeStateImplCopyWith<_$CustomThemeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
