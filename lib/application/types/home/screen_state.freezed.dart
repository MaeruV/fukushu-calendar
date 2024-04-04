// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScreenState {
  double get mediaHeight => throw _privateConstructorUsedError;
  double get mediaWidth => throw _privateConstructorUsedError;
  double get safeAreaTop => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScreenStateCopyWith<ScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreenStateCopyWith<$Res> {
  factory $ScreenStateCopyWith(
          ScreenState value, $Res Function(ScreenState) then) =
      _$ScreenStateCopyWithImpl<$Res, ScreenState>;
  @useResult
  $Res call({double mediaHeight, double mediaWidth, double safeAreaTop});
}

/// @nodoc
class _$ScreenStateCopyWithImpl<$Res, $Val extends ScreenState>
    implements $ScreenStateCopyWith<$Res> {
  _$ScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaHeight = null,
    Object? mediaWidth = null,
    Object? safeAreaTop = null,
  }) {
    return _then(_value.copyWith(
      mediaHeight: null == mediaHeight
          ? _value.mediaHeight
          : mediaHeight // ignore: cast_nullable_to_non_nullable
              as double,
      mediaWidth: null == mediaWidth
          ? _value.mediaWidth
          : mediaWidth // ignore: cast_nullable_to_non_nullable
              as double,
      safeAreaTop: null == safeAreaTop
          ? _value.safeAreaTop
          : safeAreaTop // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScreenStateImplCopyWith<$Res>
    implements $ScreenStateCopyWith<$Res> {
  factory _$$ScreenStateImplCopyWith(
          _$ScreenStateImpl value, $Res Function(_$ScreenStateImpl) then) =
      __$$ScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double mediaHeight, double mediaWidth, double safeAreaTop});
}

/// @nodoc
class __$$ScreenStateImplCopyWithImpl<$Res>
    extends _$ScreenStateCopyWithImpl<$Res, _$ScreenStateImpl>
    implements _$$ScreenStateImplCopyWith<$Res> {
  __$$ScreenStateImplCopyWithImpl(
      _$ScreenStateImpl _value, $Res Function(_$ScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaHeight = null,
    Object? mediaWidth = null,
    Object? safeAreaTop = null,
  }) {
    return _then(_$ScreenStateImpl(
      mediaHeight: null == mediaHeight
          ? _value.mediaHeight
          : mediaHeight // ignore: cast_nullable_to_non_nullable
              as double,
      mediaWidth: null == mediaWidth
          ? _value.mediaWidth
          : mediaWidth // ignore: cast_nullable_to_non_nullable
              as double,
      safeAreaTop: null == safeAreaTop
          ? _value.safeAreaTop
          : safeAreaTop // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ScreenStateImpl with DiagnosticableTreeMixin implements _ScreenState {
  const _$ScreenStateImpl(
      {required this.mediaHeight,
      required this.mediaWidth,
      required this.safeAreaTop});

  @override
  final double mediaHeight;
  @override
  final double mediaWidth;
  @override
  final double safeAreaTop;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScreenState(mediaHeight: $mediaHeight, mediaWidth: $mediaWidth, safeAreaTop: $safeAreaTop)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScreenState'))
      ..add(DiagnosticsProperty('mediaHeight', mediaHeight))
      ..add(DiagnosticsProperty('mediaWidth', mediaWidth))
      ..add(DiagnosticsProperty('safeAreaTop', safeAreaTop));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreenStateImpl &&
            (identical(other.mediaHeight, mediaHeight) ||
                other.mediaHeight == mediaHeight) &&
            (identical(other.mediaWidth, mediaWidth) ||
                other.mediaWidth == mediaWidth) &&
            (identical(other.safeAreaTop, safeAreaTop) ||
                other.safeAreaTop == safeAreaTop));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, mediaHeight, mediaWidth, safeAreaTop);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreenStateImplCopyWith<_$ScreenStateImpl> get copyWith =>
      __$$ScreenStateImplCopyWithImpl<_$ScreenStateImpl>(this, _$identity);
}

abstract class _ScreenState implements ScreenState {
  const factory _ScreenState(
      {required final double mediaHeight,
      required final double mediaWidth,
      required final double safeAreaTop}) = _$ScreenStateImpl;

  @override
  double get mediaHeight;
  @override
  double get mediaWidth;
  @override
  double get safeAreaTop;
  @override
  @JsonKey(ignore: true)
  _$$ScreenStateImplCopyWith<_$ScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
