// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditState {
  DateTime get dateTime => throw _privateConstructorUsedError;
  bool get notification => throw _privateConstructorUsedError;
  String get titleText => throw _privateConstructorUsedError;
  List<int> get intervalDays => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditStateCopyWith<EditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditStateCopyWith<$Res> {
  factory $EditStateCopyWith(EditState value, $Res Function(EditState) then) =
      _$EditStateCopyWithImpl<$Res, EditState>;
  @useResult
  $Res call(
      {DateTime dateTime,
      bool notification,
      String titleText,
      List<int> intervalDays});
}

/// @nodoc
class _$EditStateCopyWithImpl<$Res, $Val extends EditState>
    implements $EditStateCopyWith<$Res> {
  _$EditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? notification = null,
    Object? titleText = null,
    Object? intervalDays = null,
  }) {
    return _then(_value.copyWith(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as bool,
      titleText: null == titleText
          ? _value.titleText
          : titleText // ignore: cast_nullable_to_non_nullable
              as String,
      intervalDays: null == intervalDays
          ? _value.intervalDays
          : intervalDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditStateImplCopyWith<$Res>
    implements $EditStateCopyWith<$Res> {
  factory _$$EditStateImplCopyWith(
          _$EditStateImpl value, $Res Function(_$EditStateImpl) then) =
      __$$EditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime dateTime,
      bool notification,
      String titleText,
      List<int> intervalDays});
}

/// @nodoc
class __$$EditStateImplCopyWithImpl<$Res>
    extends _$EditStateCopyWithImpl<$Res, _$EditStateImpl>
    implements _$$EditStateImplCopyWith<$Res> {
  __$$EditStateImplCopyWithImpl(
      _$EditStateImpl _value, $Res Function(_$EditStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? notification = null,
    Object? titleText = null,
    Object? intervalDays = null,
  }) {
    return _then(_$EditStateImpl(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as bool,
      titleText: null == titleText
          ? _value.titleText
          : titleText // ignore: cast_nullable_to_non_nullable
              as String,
      intervalDays: null == intervalDays
          ? _value._intervalDays
          : intervalDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$EditStateImpl with DiagnosticableTreeMixin implements _EditState {
  const _$EditStateImpl(
      {required this.dateTime,
      required this.notification,
      required this.titleText,
      required final List<int> intervalDays})
      : _intervalDays = intervalDays;

  @override
  final DateTime dateTime;
  @override
  final bool notification;
  @override
  final String titleText;
  final List<int> _intervalDays;
  @override
  List<int> get intervalDays {
    if (_intervalDays is EqualUnmodifiableListView) return _intervalDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_intervalDays);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditState(dateTime: $dateTime, notification: $notification, titleText: $titleText, intervalDays: $intervalDays)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditState'))
      ..add(DiagnosticsProperty('dateTime', dateTime))
      ..add(DiagnosticsProperty('notification', notification))
      ..add(DiagnosticsProperty('titleText', titleText))
      ..add(DiagnosticsProperty('intervalDays', intervalDays));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditStateImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.titleText, titleText) ||
                other.titleText == titleText) &&
            const DeepCollectionEquality()
                .equals(other._intervalDays, _intervalDays));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime, notification,
      titleText, const DeepCollectionEquality().hash(_intervalDays));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditStateImplCopyWith<_$EditStateImpl> get copyWith =>
      __$$EditStateImplCopyWithImpl<_$EditStateImpl>(this, _$identity);
}

abstract class _EditState implements EditState {
  const factory _EditState(
      {required final DateTime dateTime,
      required final bool notification,
      required final String titleText,
      required final List<int> intervalDays}) = _$EditStateImpl;

  @override
  DateTime get dateTime;
  @override
  bool get notification;
  @override
  String get titleText;
  @override
  List<int> get intervalDays;
  @override
  @JsonKey(ignore: true)
  _$$EditStateImplCopyWith<_$EditStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
