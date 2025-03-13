import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class InterstitialAdManager implements InterstitialAdLoadCallback {
  InterstitialAd? _interstitialAd;
  bool? ready;
  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/4411468910';

  void createAd() {
    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          _interstitialAd = ad;
          ready = true;
          showAd();
        },
        onAdFailedToLoad: (error) {
          debugPrint('Interstitial ad failed to load: $error');
        },
      ),
    );
  }

  Future<void> showAd() async {
    ready = false;
    if (_interstitialAd == null) {
      debugPrint('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        debugPrint("ad onAdshowedFullscreen");
      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        debugPrint("ad Disposed");
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError aderror) {
        debugPrint('$ad OnAdFailed $aderror');
        ad.dispose();
        createAd();
      },
    );

    await _interstitialAd!.show();
    _interstitialAd = null;
  }

  @override
  FullScreenAdLoadErrorCallback get onAdFailedToLoad =>
      throw UnimplementedError();

  @override
  GenericAdEventCallback<InterstitialAd> get onAdLoaded =>
      throw UnimplementedError();
}
