// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_ad_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BannerAdState {
  bool get isLoaded => throw _privateConstructorUsedError;
  BannerAd? get bannerAd => throw _privateConstructorUsedError;
  bool get isMobileAdsInitializeCalled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BannerAdStateCopyWith<BannerAdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerAdStateCopyWith<$Res> {
  factory $BannerAdStateCopyWith(
          BannerAdState value, $Res Function(BannerAdState) then) =
      _$BannerAdStateCopyWithImpl<$Res, BannerAdState>;
  @useResult
  $Res call(
      {bool isLoaded, BannerAd? bannerAd, bool isMobileAdsInitializeCalled});
}

/// @nodoc
class _$BannerAdStateCopyWithImpl<$Res, $Val extends BannerAdState>
    implements $BannerAdStateCopyWith<$Res> {
  _$BannerAdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoaded = null,
    Object? bannerAd = freezed,
    Object? isMobileAdsInitializeCalled = null,
  }) {
    return _then(_value.copyWith(
      isLoaded: null == isLoaded
          ? _value.isLoaded
          : isLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      bannerAd: freezed == bannerAd
          ? _value.bannerAd
          : bannerAd // ignore: cast_nullable_to_non_nullable
              as BannerAd?,
      isMobileAdsInitializeCalled: null == isMobileAdsInitializeCalled
          ? _value.isMobileAdsInitializeCalled
          : isMobileAdsInitializeCalled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BannerAdStateImplCopyWith<$Res>
    implements $BannerAdStateCopyWith<$Res> {
  factory _$$BannerAdStateImplCopyWith(
          _$BannerAdStateImpl value, $Res Function(_$BannerAdStateImpl) then) =
      __$$BannerAdStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoaded, BannerAd? bannerAd, bool isMobileAdsInitializeCalled});
}

/// @nodoc
class __$$BannerAdStateImplCopyWithImpl<$Res>
    extends _$BannerAdStateCopyWithImpl<$Res, _$BannerAdStateImpl>
    implements _$$BannerAdStateImplCopyWith<$Res> {
  __$$BannerAdStateImplCopyWithImpl(
      _$BannerAdStateImpl _value, $Res Function(_$BannerAdStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoaded = null,
    Object? bannerAd = freezed,
    Object? isMobileAdsInitializeCalled = null,
  }) {
    return _then(_$BannerAdStateImpl(
      isLoaded: null == isLoaded
          ? _value.isLoaded
          : isLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      bannerAd: freezed == bannerAd
          ? _value.bannerAd
          : bannerAd // ignore: cast_nullable_to_non_nullable
              as BannerAd?,
      isMobileAdsInitializeCalled: null == isMobileAdsInitializeCalled
          ? _value.isMobileAdsInitializeCalled
          : isMobileAdsInitializeCalled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BannerAdStateImpl
    with DiagnosticableTreeMixin
    implements _BannerAdState {
  const _$BannerAdStateImpl(
      {required this.isLoaded,
      required this.bannerAd,
      required this.isMobileAdsInitializeCalled});

  @override
  final bool isLoaded;
  @override
  final BannerAd? bannerAd;
  @override
  final bool isMobileAdsInitializeCalled;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BannerAdState(isLoaded: $isLoaded, bannerAd: $bannerAd, isMobileAdsInitializeCalled: $isMobileAdsInitializeCalled)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BannerAdState'))
      ..add(DiagnosticsProperty('isLoaded', isLoaded))
      ..add(DiagnosticsProperty('bannerAd', bannerAd))
      ..add(DiagnosticsProperty(
          'isMobileAdsInitializeCalled', isMobileAdsInitializeCalled));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerAdStateImpl &&
            (identical(other.isLoaded, isLoaded) ||
                other.isLoaded == isLoaded) &&
            (identical(other.bannerAd, bannerAd) ||
                other.bannerAd == bannerAd) &&
            (identical(other.isMobileAdsInitializeCalled,
                    isMobileAdsInitializeCalled) ||
                other.isMobileAdsInitializeCalled ==
                    isMobileAdsInitializeCalled));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoaded, bannerAd, isMobileAdsInitializeCalled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerAdStateImplCopyWith<_$BannerAdStateImpl> get copyWith =>
      __$$BannerAdStateImplCopyWithImpl<_$BannerAdStateImpl>(this, _$identity);
}

abstract class _BannerAdState implements BannerAdState {
  const factory _BannerAdState(
      {required final bool isLoaded,
      required final BannerAd? bannerAd,
      required final bool isMobileAdsInitializeCalled}) = _$BannerAdStateImpl;

  @override
  bool get isLoaded;
  @override
  BannerAd? get bannerAd;
  @override
  bool get isMobileAdsInitializeCalled;
  @override
  @JsonKey(ignore: true)
  _$$BannerAdStateImplCopyWith<_$BannerAdStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
