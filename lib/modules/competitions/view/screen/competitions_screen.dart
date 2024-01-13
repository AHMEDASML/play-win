import 'package:adventur_ads/global/components/text_app_bold.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/global/utils/size_app.dart';
import 'package:adventur_ads/modules/app/controller/app_controller.dart';
import 'package:adventur_ads/modules/points/view/points_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompetitionsScreen extends StatefulWidget {
  const CompetitionsScreen({Key? key}) : super(key: key);

  @override
  State<CompetitionsScreen> createState() => _CompetitionsScreenState();
}

class _CompetitionsScreenState extends State<CompetitionsScreen> {

  final contApp = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        myPointsWidget(context: context, point: contApp.point),
          Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              textBold(
                  text: 'All competitions'.tr,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff251846)),
            ],
          ),
        ),
        const SizedBox(
          height: 90,
        ),
        Center(
            child: Image.asset('assets/images/test1.jpg',
                width: 200, height: 200)),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          width: SizeApp.screenSize.width / 1.2,
          child: Center(
            child: textBold(
                text: 'Competitions will start soon. Please visit the page'.tr,
                fontWeight: FontWeight.w400,
                color: const Color(0xff251846).withOpacity(0.7),
                sizeFont: 14),
          ),
        ),
      ]),
    );
  }
}
