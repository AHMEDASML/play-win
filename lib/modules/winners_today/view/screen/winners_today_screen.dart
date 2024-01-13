import 'package:adventur_ads/global/components/text_app_bold.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/modules/top10/view/widget/top_invitations.dart';
import 'package:adventur_ads/modules/top10/view/widget/top_points.dart';
import 'package:adventur_ads/modules/winners_today/view/widget/winners_today.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adventur_ads/modules/top10/controller/top10_controller.dart';

class WinnersTodayScreen extends StatefulWidget {
  const WinnersTodayScreen({Key? key}) : super(key: key);

  @override
  State<WinnersTodayScreen> createState() => _WinnersTodayScreenState();
}

class _WinnersTodayScreenState extends State<WinnersTodayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: textBold(text: 'Winners_Today'.tr, sizeFont: 22),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        body: WinnersToday());
  }
}
