import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'banner_ad_state.freezed.dart';

@freezed
class BannerAdState with _$BannerAdState {
  const factory BannerAdState({
    required bool isLoaded,
    required BannerAd? bannerAd,
    required bool isMobileAdsInitializeCalled,
  }) = _BannerAdState;
}
