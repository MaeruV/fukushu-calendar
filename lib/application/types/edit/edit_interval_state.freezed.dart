// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_interval_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditIntervalState {
  Intervals? get selectInterval => throw _privateConstructorUsedError;
  List<Intervals> get intervalDays => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditIntervalStateCopyWith<EditIntervalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditIntervalStateCopyWith<$Res> {
  factory $EditIntervalStateCopyWith(
          EditIntervalState value, $Res Function(EditIntervalState) then) =
      _$EditIntervalStateCopyWithImpl<$Res, EditIntervalState>;
  @useResult
  $Res call({Intervals? selectInterval, List<Intervals> intervalDays});
}

/// @nodoc
class _$EditIntervalStateCopyWithImpl<$Res, $Val extends EditIntervalState>
    implements $EditIntervalStateCopyWith<$Res> {
  _$EditIntervalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectInterval = freezed,
    Object? intervalDays = null,
  }) {
    return _then(_value.copyWith(
      selectInterval: freezed == selectInterval
          ? _value.selectInterval
          : selectInterval // ignore: cast_nullable_to_non_nullable
              as Intervals?,
      intervalDays: null == intervalDays
          ? _value.intervalDays
          : intervalDays // ignore: cast_nullable_to_non_nullable
              as List<Intervals>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditIntervalStateImplCopyWith<$Res>
    implements $EditIntervalStateCopyWith<$Res> {
  factory _$$EditIntervalStateImplCopyWith(_$EditIntervalStateImpl value,
          $Res Function(_$EditIntervalStateImpl) then) =
      __$$EditIntervalStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Intervals? selectInterval, List<Intervals> intervalDays});
}

/// @nodoc
class __$$EditIntervalStateImplCopyWithImpl<$Res>
    extends _$EditIntervalStateCopyWithImpl<$Res, _$EditIntervalStateImpl>
    implements _$$EditIntervalStateImplCopyWith<$Res> {
  __$$EditIntervalStateImplCopyWithImpl(_$EditIntervalStateImpl _value,
      $Res Function(_$EditIntervalStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectInterval = freezed,
    Object? intervalDays = null,
  }) {
    return _then(_$EditIntervalStateImpl(
      selectInterval: freezed == selectInterval
          ? _value.selectInterval
          : selectInterval // ignore: cast_nullable_to_non_nullable
              as Intervals?,
      intervalDays: null == intervalDays
          ? _value._intervalDays
          : intervalDays // ignore: cast_nullable_to_non_nullable
              as List<Intervals>,
    ));
  }
}

/// @nodoc

class _$EditIntervalStateImpl implements _EditIntervalState {
  const _$EditIntervalStateImpl(
      {required this.selectInterval,
      required final List<Intervals> intervalDays})
      : _intervalDays = intervalDays;

  @override
  final Intervals? selectInterval;
  final List<Intervals> _intervalDays;
  @override
  List<Intervals> get intervalDays {
    if (_intervalDays is EqualUnmodifiableListView) return _intervalDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_intervalDays);
  }

  @override
  String toString() {
    return 'EditIntervalState(selectInterval: $selectInterval, intervalDays: $intervalDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditIntervalStateImpl &&
            (identical(other.selectInterval, selectInterval) ||
                other.selectInterval == selectInterval) &&
            const DeepCollectionEquality()
                .equals(other._intervalDays, _intervalDays));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectInterval,
      const DeepCollectionEquality().hash(_intervalDays));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditIntervalStateImplCopyWith<_$EditIntervalStateImpl> get copyWith =>
      __$$EditIntervalStateImplCopyWithImpl<_$EditIntervalStateImpl>(
          this, _$identity);
}

abstract class _EditIntervalState implements EditIntervalState {
  const factory _EditIntervalState(
      {required final Intervals? selectInterval,
      required final List<Intervals> intervalDays}) = _$EditIntervalStateImpl;

  @override
  Intervals? get selectInterval;
  @override
  List<Intervals> get intervalDays;
  @override
  @JsonKey(ignore: true)
  _$$EditIntervalStateImplCopyWith<_$EditIntervalStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
