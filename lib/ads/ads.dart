
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


class AdmobHelper extends ChangeNotifier {
  
  int _rewardedPoint = 0;

  int getrewardpoint() => _rewardedPoint;

  static String get bannerUnit => 'ca-app-pub-9301487529015201/7644793052';

  late InterstitialAd _interstitialAd;

  late RewardedAd _rewardedAd;

  int num_of_attempt_load = 0;

  static initialization() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static BannerAd getBannerAd() {
    BannerAd bAd = new BannerAd(
        size: AdSize.fullBanner,
        adUnitId: 'ca-app-pub-9301487529015201/7644793052',
        listener: BannerAdListener(onAdClosed: (Ad ad) {
          print("Ad Closed");
        }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
        }, onAdLoaded: (Ad ad) {
          print('Ad Loaded');
        }, onAdOpened: (Ad ad) {
          print('Ad opened');
        }),
        request: AdRequest());

    return bAd;
  }

}