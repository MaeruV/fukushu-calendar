import 'dart:io';

import 'package:ebbinghaus_forgetting_curve/application/types/admod/banner_ad_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/manager/consent_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'banner_ad_view_model.g.dart';

@riverpod
class BannerAdViewModel extends _$BannerAdViewModel {
  final ConsentManager _consentManager = ConsentManager();
  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/9214589741'
      : 'ca-app-pub-3940256099942544/2435281174';

  @override
  BannerAdState build(BuildContext context) {
    return const BannerAdState(
      isLoaded: false,
      bannerAd: null,
      isMobileAdsInitializeCalled: false,
    );
  }

  void initializeMobileAdsSDK() async {
    if (state.isMobileAdsInitializeCalled) {
      return;
    }

    var canRequestAds = await _consentManager.canRequestAds();

    if (canRequestAds) {
      state = state.copyWith(isMobileAdsInitializeCalled: true);
      MobileAds.instance.initialize();
      loadAd();
    }
  }

  void loadAd() async {
    if (!await _consentManager.canRequestAds()) {
      return;
    }

    if (!context.mounted) {
      return;
    }

    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      return;
    }

    BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          state = state.copyWith(isLoaded: true, bannerAd: ad as BannerAd);
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    ).load();
  }
}
