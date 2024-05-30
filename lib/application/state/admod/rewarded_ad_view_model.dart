import 'dart:io';

import 'package:ebbinghaus_forgetting_curve/presentation/manager/consent_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'rewarded_ad_view_model.g.dart';

@riverpod
class RewardedAdViewModel extends _$RewardedAdViewModel {
  bool? ready;
  var _isMobileAdsInitializeCalled = false;
  final _consentManager = ConsentManager();

  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/5224354917'
      : 'ca-app-pub-3940256099942544/1712485313';

  @override
  RewardedAd? build() {
    return null;
  }

  void loadAd() async {
    var canRequestAds = await _consentManager.canRequestAds();
    if (!canRequestAds) {
      return;
    }
    RewardedAd.load(
        adUnitId: _adUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdShowedFullScreenContent: (ad) {
                debugPrint('Ad showed fullscreen content.');
              },
              onAdDismissedFullScreenContent: (ad) {
                debugPrint('Ad dismissed fullscreen content.');
                state = null;
                _isMobileAdsInitializeCalled = false;
                ad.dispose();
                loadAd();
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                debugPrint('Ad failed to show fullscreen content: $error');
                state = null;
                _isMobileAdsInitializeCalled = false;
                ad.dispose();
                loadAd();
              },
              onAdClicked: (ad) {});
          state = ad;
        }, onAdFailedToLoad: (LoadAdError error) {
          debugPrint('RewardedAd failed to load: $error');
        }));
  }

  void initializeMobileAdsSDK() async {
    if (_isMobileAdsInitializeCalled) {
      return;
    }
    var canRequestAds = await _consentManager.canRequestAds();
    if (canRequestAds) {
      _isMobileAdsInitializeCalled = true;
      MobileAds.instance.initialize();
      loadAd();
    }
  }
}
