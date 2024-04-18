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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnalysisState {
  List<DateTime> get oneWeek => throw _privateConstructorUsedError;
  int? get indexTapped => throw _privateConstructorUsedError;
  DateTime? get dateTimeTapped => throw _privateConstructorUsedError;

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
      {List<DateTime> oneWeek, int? indexTapped, DateTime? dateTimeTapped});
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
    Object? oneWeek = null,
    Object? indexTapped = freezed,
    Object? dateTimeTapped = freezed,
  }) {
    return _then(_value.copyWith(
      oneWeek: null == oneWeek
          ? _value.oneWeek
          : oneWeek // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      indexTapped: freezed == indexTapped
          ? _value.indexTapped
          : indexTapped // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTimeTapped: freezed == dateTimeTapped
          ? _value.dateTimeTapped
          : dateTimeTapped // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      {List<DateTime> oneWeek, int? indexTapped, DateTime? dateTimeTapped});
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
    Object? oneWeek = null,
    Object? indexTapped = freezed,
    Object? dateTimeTapped = freezed,
  }) {
    return _then(_$AnalysisStateImpl(
      oneWeek: null == oneWeek
          ? _value._oneWeek
          : oneWeek // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      indexTapped: freezed == indexTapped
          ? _value.indexTapped
          : indexTapped // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTimeTapped: freezed == dateTimeTapped
          ? _value.dateTimeTapped
          : dateTimeTapped // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$AnalysisStateImpl
    with DiagnosticableTreeMixin
    implements _AnalysisState {
  const _$AnalysisStateImpl(
      {required final List<DateTime> oneWeek,
      required this.indexTapped,
      required this.dateTimeTapped})
      : _oneWeek = oneWeek;

  final List<DateTime> _oneWeek;
  @override
  List<DateTime> get oneWeek {
    if (_oneWeek is EqualUnmodifiableListView) return _oneWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_oneWeek);
  }

  @override
  final int? indexTapped;
  @override
  final DateTime? dateTimeTapped;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AnalysisState(oneWeek: $oneWeek, indexTapped: $indexTapped, dateTimeTapped: $dateTimeTapped)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AnalysisState'))
      ..add(DiagnosticsProperty('oneWeek', oneWeek))
      ..add(DiagnosticsProperty('indexTapped', indexTapped))
      ..add(DiagnosticsProperty('dateTimeTapped', dateTimeTapped));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisStateImpl &&
            const DeepCollectionEquality().equals(other._oneWeek, _oneWeek) &&
            (identical(other.indexTapped, indexTapped) ||
                other.indexTapped == indexTapped) &&
            (identical(other.dateTimeTapped, dateTimeTapped) ||
                other.dateTimeTapped == dateTimeTapped));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_oneWeek),
      indexTapped,
      dateTimeTapped);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisStateImplCopyWith<_$AnalysisStateImpl> get copyWith =>
      __$$AnalysisStateImplCopyWithImpl<_$AnalysisStateImpl>(this, _$identity);
}

abstract class _AnalysisState implements AnalysisState {
  const factory _AnalysisState(
      {required final List<DateTime> oneWeek,
      required final int? indexTapped,
      required final DateTime? dateTimeTapped}) = _$AnalysisStateImpl;

  @override
  List<DateTime> get oneWeek;
  @override
  int? get indexTapped;
  @override
  DateTime? get dateTimeTapped;
  @override
  @JsonKey(ignore: true)
  _$$AnalysisStateImplCopyWith<_$AnalysisStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
