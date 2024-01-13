
import 'package:adventur_ads/global/common/loading_app.dart';
import 'package:adventur_ads/modules/gifts/controller/gifts_controller.dart';
import 'package:adventur_ads/modules/gifts/view/widget/cash_withdrawal_widget.dart';
import 'package:adventur_ads/modules/gifts/view/widget/gift_cards_widget.dart';
import 'package:adventur_ads/modules/home/controller/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiftsScreen extends StatefulWidget {
  const GiftsScreen({Key? key}) : super(key: key);

  @override
  State<GiftsScreen> createState() => _GiftsScreenState();
}

class _GiftsScreenState extends State<GiftsScreen> {
  String _selectedWidget = 'Cash withdrawal';
  final cont = Get.put(GiftsController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<GiftsController>(
        init: GiftsController(),
        builder: (con) {
          if (con.loading.value) {
            return Center(child: loadingAppWidget()); // Show loader
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: ItemTitleProblemsSub(
                    onItemTap: (String item) {
                      setState(() {
                        _selectedWidget = item;
                      });
                    },
                  ),
                ),
              ),
              _buildSelectedWidget(controller: con),
            ],
          );
        });
  }


  Widget _buildSelectedWidget({required GiftsController controller}) {
    switch (_selectedWidget) {
      case 'Cash withdrawal':
        return CashWithdrawalWidget(giftsModel: controller.giftsModelCashe!);
      case 'Gift cards':
        return GiftCardsWidget(giftsModel: controller.giftsModelGames!,);
      default:
        return CashWithdrawalWidget(giftsModel: controller.giftsModelGames!);
    }
  }
}


Widget buttonGift({required BuildContext context, required String text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(0xffCBBFE3)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(text,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: const Color(0xff2C1C4D), fontSize: 14)),
        ),
      ),
    ),
  );
}

class ItemTitleProblemsSub extends StatelessWidget {
  final Function(String) onItemTap;

  const ItemTitleProblemsSub({Key? key, required this.onItemTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
        onTap: () => onItemTap('Cash withdrawal'),
        child: buttonGift(context: context, text: 'Cash withdrawal'),
      ),
      GestureDetector(
        onTap: () => onItemTap('Gift cards'),
        child: buttonGift(context: context, text: 'Gift cards'),
      ),
    ]);
  }
}
