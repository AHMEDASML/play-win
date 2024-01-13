import 'package:adventur_ads/global/common/functions_app.dart';
import 'package:adventur_ads/global/utils/size_app.dart';
import 'package:adventur_ads/modules/details_gift/view/details_gift_screen.dart';
import 'package:adventur_ads/modules/gifts/models/gifts_model.dart';
import 'package:flutter/material.dart';

class GiftCardsWidget extends StatefulWidget {
  final GiftsModel giftsModel;

  const GiftCardsWidget({Key? key, required this.giftsModel}) : super(key: key);

  @override
  State<GiftCardsWidget> createState() => _GiftCardsWidgetState();
}

class _GiftCardsWidgetState extends State<GiftCardsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: widget.giftsModel.data.length,
            itemBuilder: (context, index) {
              return GiftCardsItem(giftsModel: widget.giftsModel.data[index]);
            }));
  }
}

class GiftCardsItem extends StatelessWidget {
  final Datum giftsModel;

  const GiftCardsItem({Key? key, required this.giftsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: GestureDetector(
        onTap: () {
          navigateTo(
              context,
              DetailsGiftScreen(
                idDetailsGift: giftsModel.id,
              ));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
              width: SizeApp.screenSize.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue.shade100),
              height: 170,
              child: Image.network(
                giftsModel.imageMain,
                fit: BoxFit.fill,
              )),
        ),
      ),
    );
  }
}
