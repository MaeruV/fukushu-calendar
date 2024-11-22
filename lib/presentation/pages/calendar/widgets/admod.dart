import 'package:ebbinghaus_forgetting_curve/application/config/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBanner extends StatelessWidget {
  const AdBanner({
    required this.size,
    Key? key,
  }) : super(key: key);

  final AdSize size;
  @override
  Widget build(BuildContext context) {
    final banner = BannerAd(
        size: size,
        adUnitId: AdManager.bannerAdUnitId,
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) => debugPrint('Ad loaded.'),
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            debugPrint('Ad failed to load: $error');
          },
          onAdOpened: (Ad ad) => debugPrint('Ad opened.'),
          onAdClosed: (Ad ad) => debugPrint('Ad closed.'),
        ),
        request: const AdRequest())
      ..load();

    return SizedBox(
        width: banner.size.width.toDouble(),
        height: banner.size.height.toDouble(),
        child: AdWidget(ad: banner));
  }
}
