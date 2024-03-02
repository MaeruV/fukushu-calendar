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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalenderState {
  PageController get pageController => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;

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
  $Res call({PageController pageController, int currentIndex});
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
    Object? pageController = null,
    Object? currentIndex = null,
  }) {
    return _then(_value.copyWith(
      pageController: null == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({PageController pageController, int currentIndex});
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
    Object? pageController = null,
    Object? currentIndex = null,
  }) {
    return _then(_$CalenderStateImpl(
      pageController: null == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CalenderStateImpl
    with DiagnosticableTreeMixin
    implements _CalenderState {
  const _$CalenderStateImpl(
      {required this.pageController, required this.currentIndex});

  @override
  final PageController pageController;
  @override
  final int currentIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalenderState(pageController: $pageController, currentIndex: $currentIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalenderState'))
      ..add(DiagnosticsProperty('pageController', pageController))
      ..add(DiagnosticsProperty('currentIndex', currentIndex));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalenderStateImpl &&
            (identical(other.pageController, pageController) ||
                other.pageController == pageController) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageController, currentIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalenderStateImplCopyWith<_$CalenderStateImpl> get copyWith =>
      __$$CalenderStateImplCopyWithImpl<_$CalenderStateImpl>(this, _$identity);
}

abstract class _CalenderState implements CalenderState {
  const factory _CalenderState(
      {required final PageController pageController,
      required final int currentIndex}) = _$CalenderStateImpl;

  @override
  PageController get pageController;
  @override
  int get currentIndex;
  @override
  @JsonKey(ignore: true)
  _$$CalenderStateImplCopyWith<_$CalenderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
