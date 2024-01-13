import 'package:adventur_ads/global/components/appBar_app.dart';
import 'package:adventur_ads/global/components/text_app_bold.dart';
import 'package:adventur_ads/global/endpoints/url_api.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/global/utils/size_app.dart';
import 'package:adventur_ads/modules/app/controller/app_controller.dart';
import 'package:adventur_ads/modules/details_gift/controller/details_gift_controller.dart';
import 'package:adventur_ads/modules/details_gift/models/details_gift_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsGiftScreen extends StatefulWidget {
  final int idDetailsGift;

  const DetailsGiftScreen({Key? key, required this.idDetailsGift})
      : super(key: key);

  @override
  State<DetailsGiftScreen> createState() => _DetailsGiftScreenState();
}

class _DetailsGiftScreenState extends State<DetailsGiftScreen> {
  final cont = Get.put(DetailsGiftController());

  DetailsGiftModel? detailsGiftModel;

  @override
  void initState() {
    cont.fetchDetailsData('$detailsGiftUrl${widget.idDetailsGift}',
        (DetailsGiftModel data) {
      setState(() {
        cont.detailsGiftModel = data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarApp(),
      body: GetBuilder<DetailsGiftController>(
        builder: (controller) {
          if (controller.loading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.detailsGiftModel != null) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  detailsGiftItem(data: controller.detailsGiftModel!.data),
                  ListView.builder(
                    shrinkWrap: true, // Add this
                    physics: const NeverScrollableScrollPhysics(), // Add this
                    itemCount:
                        controller.detailsGiftModel!.data.listOffers.length,
                    itemBuilder: (context, index) {
                      return listOffersItem(
                          data: controller
                              .detailsGiftModel!.data.listOffers[index],
                          image: controller.detailsGiftModel!.data.icon, context: context);
                    },
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}

Widget listOffersItem({required ListOffer data, required String image,required BuildContext context}) {
  final contApp = Get.put(AppController());
  final DetailsGiftController controller = Get.find<DetailsGiftController>();

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xffCBCBCD))),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  // Set the border radius here
                  child: Image.network(
                    image,
                    height: 50,
                  ),
                ),
                Column(
                  children: [
                    Text(data.amount.toString(),
                        style: TextStyle(
                            color: ColorManager.black4,
                            fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Text(data.points.toString(),
                            style: TextStyle(
                                color: ColorManager.black4,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(Icons.control_point_duplicate_outlined,
                            color: Colors.orange),
                      ],
                    ),
                  ],
                ),
                // Placeholder for the emoji
              ],
            ),
          ),
          const SizedBox(height: 20), // Spacing
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text('الرصيد الحالي', style: TextStyle(color: Colors.grey)),
          //   ],
          // ),
          const SizedBox(height: 20), // Spacing
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(() => controller.isRequestingGift.value
                ? const CircularProgressIndicator() // Show loader
                : Container(
              width: SizeApp.screenSize.width,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorManager.muve2),
              child: InkWell(
                onTap: () {

                  if(contApp.point == data.points){
                    controller.requestGift(id: data.id);
                  }
                  else{
                    _showNotEnoughCreditDialog(context);

                  }


                } ,
                child: const Center(
                  child: textBold(text: 'Drag', sizeFont: 18, color: Colors.white),
                ),
              ),
            ),),
          ),
        ],
      ),
    ),
  );


}

void _showNotEnoughCreditDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Insufficient Credit"),
        content: const Text("You do not have enough credit to claim this gift."),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget detailsGiftItem({required Data data}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
          width: SizeApp.screenSize.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorManager.detectorViolet),
          height: 170,
          child: Image.network(
            data.imageMain,
            fit: BoxFit.fill,
          )),
    ),
  );
}
