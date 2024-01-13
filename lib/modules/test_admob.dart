import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class TestAdmob extends StatefulWidget {
  const TestAdmob({Key? key}) : super(key: key);

  @override
  State<TestAdmob> createState() => _TestAdmobState();
}

class _TestAdmobState extends State<TestAdmob> {
  late RewardedAd myRewardedAd;
  bool isRewardedAdReady = false;

  @override
  void initState() {
    super.initState();
    loadRewardedAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                showRewardedAd();
              },
              child: const Text('Show Rewarded Ad'),
            ),
          )
        ],
      ),
    );
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
