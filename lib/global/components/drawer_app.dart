import 'package:adventur_ads/global/common/functions_app.dart';
import 'package:adventur_ads/global/components/account_data_widget.dart';
import 'package:adventur_ads/global/components/text_app_slime.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/modules/settings/view/setting_screen.dart';
import 'package:adventur_ads/modules/top10/view/screen/top10_screen.dart';
import 'package:adventur_ads/modules/winners_today/view/screen/winners_today_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

Widget drawerApp({required BuildContext context}) {

  void launchGooglePlay() async {
    // استبدل 'your_app_id' بمعرّف تطبيقك في Google Play
    const url = 'https://play.google.com/store/apps/details?id=your_app_id';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void shareApp() {
    // استبدل 'your_app_id' بمعرّف تطبيقك في Google Play
    const url = 'https://play.google.com/store/apps/details?id=your_app_id';
    Share.share('Check out my app on Google Play: $url');
  }

  return Container(
    width: 300,
    color: Colors.white,
    child: Column(
      children: [

        SizedBox(height: 30,),

        AccountDataWidget(),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Divider(
            height: 1,
            color: ColorManager.grey2.withOpacity(0.8),
          ),
        ),

        // itemDrawerApp(text: 'My Awards',icon: Icons.card_giftcard_outlined),
        // itemDrawerApp(text: 'My points',icon: Icons.timelapse_outlined),
        itemDrawerApp(
            onTap: () {
              navigateTo(context, const Top10Screen());
            },
            text: 'Top 10'.tr,
            icon: Icons.star_border),
        itemDrawerApp(
            onTap: () {
              navigateTo(context, const WinnersTodayScreen());
            },
            text: "Today's winners".tr,
            icon: Icons.account_balance_wallet_rounded),


        itemDrawerApp(text: 'Settings'.tr, icon: Icons.settings,onTap: (){
          navigateTo(context,SettingScreen());

        }),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Divider(
            height: 1,
            color: ColorManager.grey2.withOpacity(0.8),
          ),
        ),

        itemDrawerApp(
          onTap: (){
            launchGooglePlay();
          },
            text: 'Application evaluation'.tr, icon: Icons.star_border_outlined),
        itemDrawerApp(
          onTap: (){
            shareApp();
          },
            text: 'Share the application'.tr, icon: Icons.share_outlined),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Divider(
            height: 1,
            color: ColorManager.grey2.withOpacity(0.8),
          ),
        ),
        //
        // itemDrawerApp(text: 'Frequently asked questions',icon: Icons.add),
        // itemDrawerApp(text: 'Privacy Policy',icon: Icons.add),
        // itemDrawerApp(text: 'Terms of use',icon: Icons.add),
        itemDrawerApp(text: 'About the application'.tr, icon: Icons.book),
      ],
    ),
  );
}

Widget itemDrawerApp(
    {required String text, required IconData icon, void Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    child: GestureDetector(
      onTap: () {
        return onTap!();
      },
      child: Row(
        children: [
          Icon(icon, color: ColorManager.grey2, size: 28),
          const SizedBox(
            width: 12,
          ),
          textSlime(
            text: text,fontWeight: FontWeight.w600,
            color: ColorManager.firstBlack,
            sizeFont: 16,
          ),
        ],
      ),
    ),
  );
}
