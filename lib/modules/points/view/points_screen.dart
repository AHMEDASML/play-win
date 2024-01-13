import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/global/utils/size_app.dart';
import 'package:adventur_ads/modules/app/controller/app_controller.dart';
import 'package:adventur_ads/modules/points/controller/points_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PointsScreen extends StatefulWidget {
  const PointsScreen({Key? key}) : super(key: key);

  @override
  State<PointsScreen> createState() => _PointsScreenState();
}

class _PointsScreenState extends State<PointsScreen> {

  final contApp = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PointsController>(
        init: PointsController(),
        builder: (con) {
          return Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text('Your current points balance',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorManager.grey)),
              const SizedBox(
                height: 20,
              ),
              myPointsWidget(context: context, point: contApp.point),
              myFinancialPrizeWidget(context: context),
            ],
          );
        });
  }
}

Widget myPointsWidget({required BuildContext context,required int point}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: SizeApp.screenSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffFFE6AE),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('$point',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: const Color(0xff987524),fontSize: 24)),
            ),

            SizedBox(width: 10,),

            Icon(Icons.control_point_duplicate_outlined,color: Color(0xff987524),size: 24,)
          ],
        ),
      ),
    ),
  );
}

Widget myFinancialPrizeWidget({required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: ColorManager.gray6.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text('111', style: Theme.of(context).textTheme.titleMedium!),
                Text('pay pal5\$',
                    style: Theme.of(context).textTheme.titleMedium!),
                Text('58484', style: Theme.of(context).textTheme.titleMedium!),
              ],
            ),
          ),
          LinearPercentIndicator(
            width: 140.0,
            lineHeight: 14.0,
            percent: 0.5,
            backgroundColor: Colors.grey,
            progressColor: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('12%',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    ),
  );
}
