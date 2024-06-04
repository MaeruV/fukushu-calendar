import 'dart:io';

const String helpSiteUrl =
    'https://alkaline-starfish-2a5.notion.site/f6115d9b7f294f6aa7a4469a8fbb8725?pvs=4';
const String termOfUseUrl =
    'https://alkaline-starfish-2a5.notion.site/1eb180f0f28149158af2fb1bf890b9e5?pvs=4';
const String policyUrl =
    'https://alkaline-starfish-2a5.notion.site/4d7c3113e08946469f90fdefa019a6df?pvs=4';
const String kAdMobAndroidID = 'ca-app-pub-3940256099942544~3347511713';
const String kAdMobIOSID = 'ca-app-pub-3940256099942544~1458002511';

const Map<String, String> languages = {
  'ja': '日本語',
  'en': 'English',
};

class AdManager {
  // アプリIDを返す関数
  static String get appId {
    if (Platform.isAndroid) {
      return "XXX"; //AndroidのアプリID
    } else if (Platform.isIOS) {
      return "XXX"; //iOSのアプリID
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return '';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-6748272771660788/2032090097';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "";
    } else if (Platform.isIOS) {
      return "";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "";
    } else if (Platform.isIOS) {
      return "ca-app-pub-6748272771660788/1796533791";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
