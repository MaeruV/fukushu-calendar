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
  String get title => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  List<int> get intervalDays => throw _privateConstructorUsedError;
  bool get hasTask => throw _privateConstructorUsedError;
  int get pallete => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  bool get hasChanges => throw _privateConstructorUsedError;

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
      {String title,
      String memo,
      DateTime dateTime,
      List<int> intervalDays,
      bool hasTask,
      int pallete,
      DateTime time,
      bool hasChanges});
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
    Object? title = null,
    Object? memo = null,
    Object? dateTime = null,
    Object? intervalDays = null,
    Object? hasTask = null,
    Object? pallete = null,
    Object? time = null,
    Object? hasChanges = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      intervalDays: null == intervalDays
          ? _value.intervalDays
          : intervalDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      hasTask: null == hasTask
          ? _value.hasTask
          : hasTask // ignore: cast_nullable_to_non_nullable
              as bool,
      pallete: null == pallete
          ? _value.pallete
          : pallete // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hasChanges: null == hasChanges
          ? _value.hasChanges
          : hasChanges // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {String title,
      String memo,
      DateTime dateTime,
      List<int> intervalDays,
      bool hasTask,
      int pallete,
      DateTime time,
      bool hasChanges});
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
    Object? title = null,
    Object? memo = null,
    Object? dateTime = null,
    Object? intervalDays = null,
    Object? hasTask = null,
    Object? pallete = null,
    Object? time = null,
    Object? hasChanges = null,
  }) {
    return _then(_$EditStateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      intervalDays: null == intervalDays
          ? _value._intervalDays
          : intervalDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      hasTask: null == hasTask
          ? _value.hasTask
          : hasTask // ignore: cast_nullable_to_non_nullable
              as bool,
      pallete: null == pallete
          ? _value.pallete
          : pallete // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hasChanges: null == hasChanges
          ? _value.hasChanges
          : hasChanges // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EditStateImpl with DiagnosticableTreeMixin implements _EditState {
  const _$EditStateImpl(
      {required this.title,
      required this.memo,
      required this.dateTime,
      required final List<int> intervalDays,
      required this.hasTask,
      required this.pallete,
      required this.time,
      this.hasChanges = false})
      : _intervalDays = intervalDays;

  @override
  final String title;
  @override
  final String memo;
  @override
  final DateTime dateTime;
  final List<int> _intervalDays;
  @override
  List<int> get intervalDays {
    if (_intervalDays is EqualUnmodifiableListView) return _intervalDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_intervalDays);
  }

  @override
  final bool hasTask;
  @override
  final int pallete;
  @override
  final DateTime time;
  @override
  @JsonKey()
  final bool hasChanges;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditState(title: $title, memo: $memo, dateTime: $dateTime, intervalDays: $intervalDays, hasTask: $hasTask, pallete: $pallete, time: $time, hasChanges: $hasChanges)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditState'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('memo', memo))
      ..add(DiagnosticsProperty('dateTime', dateTime))
      ..add(DiagnosticsProperty('intervalDays', intervalDays))
      ..add(DiagnosticsProperty('hasTask', hasTask))
      ..add(DiagnosticsProperty('pallete', pallete))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('hasChanges', hasChanges));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            const DeepCollectionEquality()
                .equals(other._intervalDays, _intervalDays) &&
            (identical(other.hasTask, hasTask) || other.hasTask == hasTask) &&
            (identical(other.pallete, pallete) || other.pallete == pallete) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.hasChanges, hasChanges) ||
                other.hasChanges == hasChanges));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      memo,
      dateTime,
      const DeepCollectionEquality().hash(_intervalDays),
      hasTask,
      pallete,
      time,
      hasChanges);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditStateImplCopyWith<_$EditStateImpl> get copyWith =>
      __$$EditStateImplCopyWithImpl<_$EditStateImpl>(this, _$identity);
}

abstract class _EditState implements EditState {
  const factory _EditState(
      {required final String title,
      required final String memo,
      required final DateTime dateTime,
      required final List<int> intervalDays,
      required final bool hasTask,
      required final int pallete,
      required final DateTime time,
      final bool hasChanges}) = _$EditStateImpl;

  @override
  String get title;
  @override
  String get memo;
  @override
  DateTime get dateTime;
  @override
  List<int> get intervalDays;
  @override
  bool get hasTask;
  @override
  int get pallete;
  @override
  DateTime get time;
  @override
  bool get hasChanges;
  @override
  @JsonKey(ignore: true)
  _$$EditStateImplCopyWith<_$EditStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
