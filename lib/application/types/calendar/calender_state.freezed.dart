// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calender_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalenderState {
  DateTime? get cellDateTime => throw _privateConstructorUsedError;
  List<CalendarEvent> get dayEvents => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalenderStateCopyWith<CalenderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalenderStateCopyWith<$Res> {
  factory $CalenderStateCopyWith(
          CalenderState value, $Res Function(CalenderState) then) =
      _$CalenderStateCopyWithImpl<$Res, CalenderState>;
  @useResult
  $Res call({DateTime? cellDateTime, List<CalendarEvent> dayEvents});
}

/// @nodoc
class _$CalenderStateCopyWithImpl<$Res, $Val extends CalenderState>
    implements $CalenderStateCopyWith<$Res> {
  _$CalenderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cellDateTime = freezed,
    Object? dayEvents = null,
  }) {
    return _then(_value.copyWith(
      cellDateTime: freezed == cellDateTime
          ? _value.cellDateTime
          : cellDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dayEvents: null == dayEvents
          ? _value.dayEvents
          : dayEvents // ignore: cast_nullable_to_non_nullable
              as List<CalendarEvent>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalenderStateImplCopyWith<$Res>
    implements $CalenderStateCopyWith<$Res> {
  factory _$$CalenderStateImplCopyWith(
          _$CalenderStateImpl value, $Res Function(_$CalenderStateImpl) then) =
      __$$CalenderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? cellDateTime, List<CalendarEvent> dayEvents});
}

/// @nodoc
class __$$CalenderStateImplCopyWithImpl<$Res>
    extends _$CalenderStateCopyWithImpl<$Res, _$CalenderStateImpl>
    implements _$$CalenderStateImplCopyWith<$Res> {
  __$$CalenderStateImplCopyWithImpl(
      _$CalenderStateImpl _value, $Res Function(_$CalenderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cellDateTime = freezed,
    Object? dayEvents = null,
  }) {
    return _then(_$CalenderStateImpl(
      cellDateTime: freezed == cellDateTime
          ? _value.cellDateTime
          : cellDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dayEvents: null == dayEvents
          ? _value._dayEvents
          : dayEvents // ignore: cast_nullable_to_non_nullable
              as List<CalendarEvent>,
    ));
  }
}

/// @nodoc

class _$CalenderStateImpl
    with DiagnosticableTreeMixin
    implements _CalenderState {
  const _$CalenderStateImpl(
      {required this.cellDateTime,
      required final List<CalendarEvent> dayEvents})
      : _dayEvents = dayEvents;

  @override
  final DateTime? cellDateTime;
  final List<CalendarEvent> _dayEvents;
  @override
  List<CalendarEvent> get dayEvents {
    if (_dayEvents is EqualUnmodifiableListView) return _dayEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dayEvents);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalenderState(cellDateTime: $cellDateTime, dayEvents: $dayEvents)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalenderState'))
      ..add(DiagnosticsProperty('cellDateTime', cellDateTime))
      ..add(DiagnosticsProperty('dayEvents', dayEvents));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalenderStateImpl &&
            (identical(other.cellDateTime, cellDateTime) ||
                other.cellDateTime == cellDateTime) &&
            const DeepCollectionEquality()
                .equals(other._dayEvents, _dayEvents));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cellDateTime,
      const DeepCollectionEquality().hash(_dayEvents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalenderStateImplCopyWith<_$CalenderStateImpl> get copyWith =>
      __$$CalenderStateImplCopyWithImpl<_$CalenderStateImpl>(this, _$identity);
}

abstract class _CalenderState implements CalenderState {
  const factory _CalenderState(
      {required final DateTime? cellDateTime,
      required final List<CalendarEvent> dayEvents}) = _$CalenderStateImpl;

  @override
  DateTime? get cellDateTime;
  @override
  List<CalendarEvent> get dayEvents;
  @override
  @JsonKey(ignore: true)
  _$$CalenderStateImplCopyWith<_$CalenderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
