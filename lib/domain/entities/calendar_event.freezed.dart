// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalendarEvent {
  String get eventName => throw _privateConstructorUsedError;
  DateTime get eventDate => throw _privateConstructorUsedError;
  int get eventID => throw _privateConstructorUsedError;
  Color get eventBackgroundColor => throw _privateConstructorUsedError;
  TaskDate? get taskDate => throw _privateConstructorUsedError;
  bool get completedFlag => throw _privateConstructorUsedError;
  ReviewRange get rangeType => throw _privateConstructorUsedError;
  int get firstRange => throw _privateConstructorUsedError;
  int? get secoundRange => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarEventCopyWith<CalendarEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarEventCopyWith<$Res> {
  factory $CalendarEventCopyWith(
          CalendarEvent value, $Res Function(CalendarEvent) then) =
      _$CalendarEventCopyWithImpl<$Res, CalendarEvent>;
  @useResult
  $Res call(
      {String eventName,
      DateTime eventDate,
      int eventID,
      Color eventBackgroundColor,
      TaskDate? taskDate,
      bool completedFlag,
      ReviewRange rangeType,
      int firstRange,
      int? secoundRange});
}

/// @nodoc
class _$CalendarEventCopyWithImpl<$Res, $Val extends CalendarEvent>
    implements $CalendarEventCopyWith<$Res> {
  _$CalendarEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventName = null,
    Object? eventDate = null,
    Object? eventID = null,
    Object? eventBackgroundColor = null,
    Object? taskDate = freezed,
    Object? completedFlag = null,
    Object? rangeType = null,
    Object? firstRange = null,
    Object? secoundRange = freezed,
  }) {
    return _then(_value.copyWith(
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      eventDate: null == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventID: null == eventID
          ? _value.eventID
          : eventID // ignore: cast_nullable_to_non_nullable
              as int,
      eventBackgroundColor: null == eventBackgroundColor
          ? _value.eventBackgroundColor
          : eventBackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      taskDate: freezed == taskDate
          ? _value.taskDate
          : taskDate // ignore: cast_nullable_to_non_nullable
              as TaskDate?,
      completedFlag: null == completedFlag
          ? _value.completedFlag
          : completedFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      rangeType: null == rangeType
          ? _value.rangeType
          : rangeType // ignore: cast_nullable_to_non_nullable
              as ReviewRange,
      firstRange: null == firstRange
          ? _value.firstRange
          : firstRange // ignore: cast_nullable_to_non_nullable
              as int,
      secoundRange: freezed == secoundRange
          ? _value.secoundRange
          : secoundRange // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarEventImplCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$$CalendarEventImplCopyWith(
          _$CalendarEventImpl value, $Res Function(_$CalendarEventImpl) then) =
      __$$CalendarEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventName,
      DateTime eventDate,
      int eventID,
      Color eventBackgroundColor,
      TaskDate? taskDate,
      bool completedFlag,
      ReviewRange rangeType,
      int firstRange,
      int? secoundRange});
}

/// @nodoc
class __$$CalendarEventImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$CalendarEventImpl>
    implements _$$CalendarEventImplCopyWith<$Res> {
  __$$CalendarEventImplCopyWithImpl(
      _$CalendarEventImpl _value, $Res Function(_$CalendarEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventName = null,
    Object? eventDate = null,
    Object? eventID = null,
    Object? eventBackgroundColor = null,
    Object? taskDate = freezed,
    Object? completedFlag = null,
    Object? rangeType = null,
    Object? firstRange = null,
    Object? secoundRange = freezed,
  }) {
    return _then(_$CalendarEventImpl(
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      eventDate: null == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventID: null == eventID
          ? _value.eventID
          : eventID // ignore: cast_nullable_to_non_nullable
              as int,
      eventBackgroundColor: null == eventBackgroundColor
          ? _value.eventBackgroundColor
          : eventBackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      taskDate: freezed == taskDate
          ? _value.taskDate
          : taskDate // ignore: cast_nullable_to_non_nullable
              as TaskDate?,
      completedFlag: null == completedFlag
          ? _value.completedFlag
          : completedFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      rangeType: null == rangeType
          ? _value.rangeType
          : rangeType // ignore: cast_nullable_to_non_nullable
              as ReviewRange,
      firstRange: null == firstRange
          ? _value.firstRange
          : firstRange // ignore: cast_nullable_to_non_nullable
              as int,
      secoundRange: freezed == secoundRange
          ? _value.secoundRange
          : secoundRange // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CalendarEventImpl implements _CalendarEvent {
  const _$CalendarEventImpl(
      {required this.eventName,
      required this.eventDate,
      required this.eventID,
      required this.eventBackgroundColor,
      required this.taskDate,
      required this.completedFlag,
      required this.rangeType,
      required this.firstRange,
      required this.secoundRange});

  @override
  final String eventName;
  @override
  final DateTime eventDate;
  @override
  final int eventID;
  @override
  final Color eventBackgroundColor;
  @override
  final TaskDate? taskDate;
  @override
  final bool completedFlag;
  @override
  final ReviewRange rangeType;
  @override
  final int firstRange;
  @override
  final int? secoundRange;

  @override
  String toString() {
    return 'CalendarEvent(eventName: $eventName, eventDate: $eventDate, eventID: $eventID, eventBackgroundColor: $eventBackgroundColor, taskDate: $taskDate, completedFlag: $completedFlag, rangeType: $rangeType, firstRange: $firstRange, secoundRange: $secoundRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarEventImpl &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate) &&
            (identical(other.eventID, eventID) || other.eventID == eventID) &&
            (identical(other.eventBackgroundColor, eventBackgroundColor) ||
                other.eventBackgroundColor == eventBackgroundColor) &&
            (identical(other.taskDate, taskDate) ||
                other.taskDate == taskDate) &&
            (identical(other.completedFlag, completedFlag) ||
                other.completedFlag == completedFlag) &&
            (identical(other.rangeType, rangeType) ||
                other.rangeType == rangeType) &&
            (identical(other.firstRange, firstRange) ||
                other.firstRange == firstRange) &&
            (identical(other.secoundRange, secoundRange) ||
                other.secoundRange == secoundRange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventName,
      eventDate,
      eventID,
      eventBackgroundColor,
      taskDate,
      completedFlag,
      rangeType,
      firstRange,
      secoundRange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarEventImplCopyWith<_$CalendarEventImpl> get copyWith =>
      __$$CalendarEventImplCopyWithImpl<_$CalendarEventImpl>(this, _$identity);
}

abstract class _CalendarEvent implements CalendarEvent {
  const factory _CalendarEvent(
      {required final String eventName,
      required final DateTime eventDate,
      required final int eventID,
      required final Color eventBackgroundColor,
      required final TaskDate? taskDate,
      required final bool completedFlag,
      required final ReviewRange rangeType,
      required final int firstRange,
      required final int? secoundRange}) = _$CalendarEventImpl;

  @override
  String get eventName;
  @override
  DateTime get eventDate;
  @override
  int get eventID;
  @override
  Color get eventBackgroundColor;
  @override
  TaskDate? get taskDate;
  @override
  bool get completedFlag;
  @override
  ReviewRange get rangeType;
  @override
  int get firstRange;
  @override
  int? get secoundRange;
  @override
  @JsonKey(ignore: true)
  _$$CalendarEventImplCopyWith<_$CalendarEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
