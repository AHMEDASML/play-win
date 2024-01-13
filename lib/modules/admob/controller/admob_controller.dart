import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobController extends GetxController{
  late RewardedAd myRewardedAd;
  bool isRewardedAdReady = false;


  @override
  void onInit() {
    loadRewardedAd();
    super.onInit();
  }

  void loadRewardedAd() {
    RewardedAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/5224354917',
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            myRewardedAd = ad;
            isRewardedAdReady = true;
          },
          onAdFailedToLoad: (error) {
            print('Ad failed to load: $error');
            isRewardedAdReady = false;
          },
        )
    );
  }

  void showRewardedAd() {
    if (isRewardedAdReady) {
      myRewardedAd.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
        print('Reward earned: ${reward.amount}');
        loadRewardedAd();
      });
      // Reset the flag
      isRewardedAdReady = false;
    } else {
      print('The ad is not ready yet');
    }
  }

}