import 'package:adventur_ads/global/common/loading_app.dart';
import 'package:adventur_ads/global/components/text_app_bold.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/modules/top10/controller/top10_controller.dart';
import 'package:adventur_ads/modules/top10/view/widget/top_invitations.dart';
import 'package:adventur_ads/modules/top10/view/widget/top_points.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Top10Screen extends StatefulWidget {
  const Top10Screen({Key? key}) : super(key: key);

  @override
  State<Top10Screen> createState() => _Top10ScreenState();
}

class _Top10ScreenState extends State<Top10Screen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Top10Controller cont = Get.put(Top10Controller());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: textBold(text: 'Top_10'.tr, sizeFont: 22),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBar(
              controller: _tabController,
              tabs: <Widget>[
                Tab(
                  child: textBold(
                      text: 'points'.tr,
                      sizeFont: 14,
                      color: ColorManager.muve),
                ),
                Tab(
                  child: textBold(
                    text: 'Invitations'.tr,
                    color: ColorManager.muve,
                    sizeFont: 14,
                  ),
                ),
              ],
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // Creates border
                color: ColorManager.detectorViolet, // Change your color here
              ),
            ),
          ),
        ),
      ),
      body: GetBuilder<Top10Controller>(
        builder: (controller) {
          if (controller.loading.value) {
            return Center(child: loadingAppWidget());
          } else if (controller.topTenPointsModel != null &&
              controller.topTenInvitationsModel != null) {
            return TabBarView(
              controller: _tabController,
              children: [
                TopPoints(
                    topTenPointsModel: controller.topTenPointsModel!.data),
                TopInvitations(
                    topInvitationsModel:
                        controller.topTenInvitationsModel!.data),
              ],
            );
          } else {
            return Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
