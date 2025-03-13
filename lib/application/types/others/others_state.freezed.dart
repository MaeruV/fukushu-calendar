// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'others_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OthersState {
  WebViewController? get helpSiteController =>
      throw _privateConstructorUsedError;
  WebViewController? get termOfUseController =>
      throw _privateConstructorUsedError;
  WebViewController? get policyController => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OthersStateCopyWith<OthersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OthersStateCopyWith<$Res> {
  factory $OthersStateCopyWith(
          OthersState value, $Res Function(OthersState) then) =
      _$OthersStateCopyWithImpl<$Res, OthersState>;
  @useResult
  $Res call(
      {WebViewController? helpSiteController,
      WebViewController? termOfUseController,
      WebViewController? policyController});
}

/// @nodoc
class _$OthersStateCopyWithImpl<$Res, $Val extends OthersState>
    implements $OthersStateCopyWith<$Res> {
  _$OthersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? helpSiteController = freezed,
    Object? termOfUseController = freezed,
    Object? policyController = freezed,
  }) {
    return _then(_value.copyWith(
      helpSiteController: freezed == helpSiteController
          ? _value.helpSiteController
          : helpSiteController // ignore: cast_nullable_to_non_nullable
              as WebViewController?,
      termOfUseController: freezed == termOfUseController
          ? _value.termOfUseController
          : termOfUseController // ignore: cast_nullable_to_non_nullable
              as WebViewController?,
      policyController: freezed == policyController
          ? _value.policyController
          : policyController // ignore: cast_nullable_to_non_nullable
              as WebViewController?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OthersStateImplCopyWith<$Res>
    implements $OthersStateCopyWith<$Res> {
  factory _$$OthersStateImplCopyWith(
          _$OthersStateImpl value, $Res Function(_$OthersStateImpl) then) =
      __$$OthersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WebViewController? helpSiteController,
      WebViewController? termOfUseController,
      WebViewController? policyController});
}

/// @nodoc
class __$$OthersStateImplCopyWithImpl<$Res>
    extends _$OthersStateCopyWithImpl<$Res, _$OthersStateImpl>
    implements _$$OthersStateImplCopyWith<$Res> {
  __$$OthersStateImplCopyWithImpl(
      _$OthersStateImpl _value, $Res Function(_$OthersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? helpSiteController = freezed,
    Object? termOfUseController = freezed,
    Object? policyController = freezed,
  }) {
    return _then(_$OthersStateImpl(
      helpSiteController: freezed == helpSiteController
          ? _value.helpSiteController
          : helpSiteController // ignore: cast_nullable_to_non_nullable
              as WebViewController?,
      termOfUseController: freezed == termOfUseController
          ? _value.termOfUseController
          : termOfUseController // ignore: cast_nullable_to_non_nullable
              as WebViewController?,
      policyController: freezed == policyController
          ? _value.policyController
          : policyController // ignore: cast_nullable_to_non_nullable
              as WebViewController?,
    ));
  }
}

/// @nodoc

class _$OthersStateImpl with DiagnosticableTreeMixin implements _OthersState {
  const _$OthersStateImpl(
      {required this.helpSiteController,
      required this.termOfUseController,
      required this.policyController});

  @override
  final WebViewController? helpSiteController;
  @override
  final WebViewController? termOfUseController;
  @override
  final WebViewController? policyController;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OthersState(helpSiteController: $helpSiteController, termOfUseController: $termOfUseController, policyController: $policyController)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OthersState'))
      ..add(DiagnosticsProperty('helpSiteController', helpSiteController))
      ..add(DiagnosticsProperty('termOfUseController', termOfUseController))
      ..add(DiagnosticsProperty('policyController', policyController));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OthersStateImpl &&
            (identical(other.helpSiteController, helpSiteController) ||
                other.helpSiteController == helpSiteController) &&
            (identical(other.termOfUseController, termOfUseController) ||
                other.termOfUseController == termOfUseController) &&
            (identical(other.policyController, policyController) ||
                other.policyController == policyController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, helpSiteController, termOfUseController, policyController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OthersStateImplCopyWith<_$OthersStateImpl> get copyWith =>
      __$$OthersStateImplCopyWithImpl<_$OthersStateImpl>(this, _$identity);
}

abstract class _OthersState implements OthersState {
  const factory _OthersState(
      {required final WebViewController? helpSiteController,
      required final WebViewController? termOfUseController,
      required final WebViewController? policyController}) = _$OthersStateImpl;

  @override
  WebViewController? get helpSiteController;
  @override
  WebViewController? get termOfUseController;
  @override
  WebViewController? get policyController;
  @override
  @JsonKey(ignore: true)
  _$$OthersStateImplCopyWith<_$OthersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
