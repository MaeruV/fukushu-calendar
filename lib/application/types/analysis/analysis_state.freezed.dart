// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnalysisState {
  List<DateTime> get range => throw _privateConstructorUsedError;
  int? get indexTapped => throw _privateConstructorUsedError;
  List<DateTime> get dateTimeTapped => throw _privateConstructorUsedError;
  DisplayMode get displayMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnalysisStateCopyWith<AnalysisState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisStateCopyWith<$Res> {
  factory $AnalysisStateCopyWith(
          AnalysisState value, $Res Function(AnalysisState) then) =
      _$AnalysisStateCopyWithImpl<$Res, AnalysisState>;
  @useResult
  $Res call(
      {List<DateTime> range,
      int? indexTapped,
      List<DateTime> dateTimeTapped,
      DisplayMode displayMode});
}

/// @nodoc
class _$AnalysisStateCopyWithImpl<$Res, $Val extends AnalysisState>
    implements $AnalysisStateCopyWith<$Res> {
  _$AnalysisStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? range = null,
    Object? indexTapped = freezed,
    Object? dateTimeTapped = null,
    Object? displayMode = null,
  }) {
    return _then(_value.copyWith(
      range: null == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      indexTapped: freezed == indexTapped
          ? _value.indexTapped
          : indexTapped // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTimeTapped: null == dateTimeTapped
          ? _value.dateTimeTapped
          : dateTimeTapped // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      displayMode: null == displayMode
          ? _value.displayMode
          : displayMode // ignore: cast_nullable_to_non_nullable
              as DisplayMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalysisStateImplCopyWith<$Res>
    implements $AnalysisStateCopyWith<$Res> {
  factory _$$AnalysisStateImplCopyWith(
          _$AnalysisStateImpl value, $Res Function(_$AnalysisStateImpl) then) =
      __$$AnalysisStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DateTime> range,
      int? indexTapped,
      List<DateTime> dateTimeTapped,
      DisplayMode displayMode});
}

/// @nodoc
class __$$AnalysisStateImplCopyWithImpl<$Res>
    extends _$AnalysisStateCopyWithImpl<$Res, _$AnalysisStateImpl>
    implements _$$AnalysisStateImplCopyWith<$Res> {
  __$$AnalysisStateImplCopyWithImpl(
      _$AnalysisStateImpl _value, $Res Function(_$AnalysisStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? range = null,
    Object? indexTapped = freezed,
    Object? dateTimeTapped = null,
    Object? displayMode = null,
  }) {
    return _then(_$AnalysisStateImpl(
      range: null == range
          ? _value._range
          : range // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      indexTapped: freezed == indexTapped
          ? _value.indexTapped
          : indexTapped // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTimeTapped: null == dateTimeTapped
          ? _value._dateTimeTapped
          : dateTimeTapped // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      displayMode: null == displayMode
          ? _value.displayMode
          : displayMode // ignore: cast_nullable_to_non_nullable
              as DisplayMode,
    ));
  }
}

/// @nodoc

class _$AnalysisStateImpl
    with DiagnosticableTreeMixin
    implements _AnalysisState {
  const _$AnalysisStateImpl(
      {required final List<DateTime> range,
      required this.indexTapped,
      required final List<DateTime> dateTimeTapped,
      required this.displayMode})
      : _range = range,
        _dateTimeTapped = dateTimeTapped;

  final List<DateTime> _range;
  @override
  List<DateTime> get range {
    if (_range is EqualUnmodifiableListView) return _range;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_range);
  }

  @override
  final int? indexTapped;
  final List<DateTime> _dateTimeTapped;
  @override
  List<DateTime> get dateTimeTapped {
    if (_dateTimeTapped is EqualUnmodifiableListView) return _dateTimeTapped;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dateTimeTapped);
  }

  @override
  final DisplayMode displayMode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AnalysisState(range: $range, indexTapped: $indexTapped, dateTimeTapped: $dateTimeTapped, displayMode: $displayMode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AnalysisState'))
      ..add(DiagnosticsProperty('range', range))
      ..add(DiagnosticsProperty('indexTapped', indexTapped))
      ..add(DiagnosticsProperty('dateTimeTapped', dateTimeTapped))
      ..add(DiagnosticsProperty('displayMode', displayMode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisStateImpl &&
            const DeepCollectionEquality().equals(other._range, _range) &&
            (identical(other.indexTapped, indexTapped) ||
                other.indexTapped == indexTapped) &&
            const DeepCollectionEquality()
                .equals(other._dateTimeTapped, _dateTimeTapped) &&
            (identical(other.displayMode, displayMode) ||
                other.displayMode == displayMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_range),
      indexTapped,
      const DeepCollectionEquality().hash(_dateTimeTapped),
      displayMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisStateImplCopyWith<_$AnalysisStateImpl> get copyWith =>
      __$$AnalysisStateImplCopyWithImpl<_$AnalysisStateImpl>(this, _$identity);
}

abstract class _AnalysisState implements AnalysisState {
  const factory _AnalysisState(
      {required final List<DateTime> range,
      required final int? indexTapped,
      required final List<DateTime> dateTimeTapped,
      required final DisplayMode displayMode}) = _$AnalysisStateImpl;

  @override
  List<DateTime> get range;
  @override
  int? get indexTapped;
  @override
  List<DateTime> get dateTimeTapped;
  @override
  DisplayMode get displayMode;
  @override
  @JsonKey(ignore: true)
  _$$AnalysisStateImplCopyWith<_$AnalysisStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
