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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalendarEvent {
  String get eventName => throw _privateConstructorUsedError;
  TextStyle get eventTextStyle => throw _privateConstructorUsedError;
  DateTime get eventDate => throw _privateConstructorUsedError;
  String? get eventID => throw _privateConstructorUsedError;
  Color get eventBackgroundColor => throw _privateConstructorUsedError;

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
      TextStyle eventTextStyle,
      DateTime eventDate,
      String? eventID,
      Color eventBackgroundColor});
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
    Object? eventTextStyle = null,
    Object? eventDate = null,
    Object? eventID = freezed,
    Object? eventBackgroundColor = null,
  }) {
    return _then(_value.copyWith(
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      eventTextStyle: null == eventTextStyle
          ? _value.eventTextStyle
          : eventTextStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      eventDate: null == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventID: freezed == eventID
          ? _value.eventID
          : eventID // ignore: cast_nullable_to_non_nullable
              as String?,
      eventBackgroundColor: null == eventBackgroundColor
          ? _value.eventBackgroundColor
          : eventBackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
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
      TextStyle eventTextStyle,
      DateTime eventDate,
      String? eventID,
      Color eventBackgroundColor});
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
    Object? eventTextStyle = null,
    Object? eventDate = null,
    Object? eventID = freezed,
    Object? eventBackgroundColor = null,
  }) {
    return _then(_$CalendarEventImpl(
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      eventTextStyle: null == eventTextStyle
          ? _value.eventTextStyle
          : eventTextStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      eventDate: null == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventID: freezed == eventID
          ? _value.eventID
          : eventID // ignore: cast_nullable_to_non_nullable
              as String?,
      eventBackgroundColor: null == eventBackgroundColor
          ? _value.eventBackgroundColor
          : eventBackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$CalendarEventImpl implements _CalendarEvent {
  const _$CalendarEventImpl(
      {required this.eventName,
      required this.eventTextStyle,
      required this.eventDate,
      required this.eventID,
      required this.eventBackgroundColor});

  @override
  final String eventName;
  @override
  final TextStyle eventTextStyle;
  @override
  final DateTime eventDate;
  @override
  final String? eventID;
  @override
  final Color eventBackgroundColor;

  @override
  String toString() {
    return 'CalendarEvent(eventName: $eventName, eventTextStyle: $eventTextStyle, eventDate: $eventDate, eventID: $eventID, eventBackgroundColor: $eventBackgroundColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarEventImpl &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.eventTextStyle, eventTextStyle) ||
                other.eventTextStyle == eventTextStyle) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate) &&
            (identical(other.eventID, eventID) || other.eventID == eventID) &&
            (identical(other.eventBackgroundColor, eventBackgroundColor) ||
                other.eventBackgroundColor == eventBackgroundColor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventName, eventTextStyle,
      eventDate, eventID, eventBackgroundColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarEventImplCopyWith<_$CalendarEventImpl> get copyWith =>
      __$$CalendarEventImplCopyWithImpl<_$CalendarEventImpl>(this, _$identity);
}

abstract class _CalendarEvent implements CalendarEvent {
  const factory _CalendarEvent(
      {required final String eventName,
      required final TextStyle eventTextStyle,
      required final DateTime eventDate,
      required final String? eventID,
      required final Color eventBackgroundColor}) = _$CalendarEventImpl;

  @override
  String get eventName;
  @override
  TextStyle get eventTextStyle;
  @override
  DateTime get eventDate;
  @override
  String? get eventID;
  @override
  Color get eventBackgroundColor;
  @override
  @JsonKey(ignore: true)
  _$$CalendarEventImplCopyWith<_$CalendarEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
